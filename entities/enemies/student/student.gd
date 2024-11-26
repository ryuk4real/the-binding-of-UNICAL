class_name Student
extends Enemy

@export var movement_speed: float = 15.0
@export var wander_range: float = 50.0
@export var idle_time: float = 3.0
@export var wander_time: float = 4.0
@export var shooting_cooldown: float = 3.0
@export var shooting_cooldown_random_range: float = 0.5
@export var shooting_pause_time: float = 0.8
@export var shooting_range: float = 100.0
@export var shooting_delay: float = 1.5

var projectile_resource: Resource = load("res://entities/enemy_projectile/enemy_projectile.tscn")
var current_state: EnemyState = EnemyState.IDLE
var state_timer: float = 0.0
var shooting_timer: float = 0.0
var shooting_delay_timer: float = 0.0
var is_preparing_to_shoot: bool = false
var current_cooldown: float = shooting_cooldown
var is_chasing: bool = false
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	navigation_agent.max_speed = movement_speed
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	animated_sprite_2d.play("IDLE")
	
	shooting_timer = rng.randf_range(0, shooting_cooldown)
	randomize_shooting_cooldown()
	
	SignalBus.student_damage_changed.emit()

func randomize_shooting_cooldown() -> void:
	var random_variation = rng.randf_range(-shooting_cooldown_random_range, shooting_cooldown_random_range)
	current_cooldown = shooting_cooldown + random_variation
	current_cooldown += rng.randf_range(-shooting_cooldown_random_range, shooting_cooldown_random_range)
	current_cooldown = max(2.0, current_cooldown)

func _physics_process(delta: float) -> void:
	if enabled:
		if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
			return
			
		shooting_timer += delta
		
		if is_chasing and current_state != EnemyState.SHOOTING:
			current_state = EnemyState.CHASING
		
		match current_state:
			EnemyState.IDLE:
				velocity = Vector2.ZERO
				state_timer += delta
				if state_timer >= idle_time:
					choose_random_target()
					current_state = EnemyState.WANDERING
					state_timer = 0.0
					
			EnemyState.WANDERING:
				state_timer += delta
				if state_timer >= wander_time:
					current_state = EnemyState.IDLE
					state_timer = 0.0
					velocity = Vector2.ZERO
					animated_sprite_2d.play("IDLE")
				else:
					move_to_target()
					if navigation_agent.is_navigation_finished():
						choose_random_target()
					
			EnemyState.CHASING:
				if Global.player:
					var distance_to_player = global_position.distance_to(Global.player.global_position)
					
					if distance_to_player <= shooting_range and shooting_timer >= shooting_cooldown:
						if not is_preparing_to_shoot:
							# Start the shooting preparation
							is_preparing_to_shoot = true
							shooting_delay_timer = 0.0
							animated_sprite_2d.play("IDLE")
							velocity = Vector2.ZERO
						else:
							# Count up the delay timer
							shooting_delay_timer += delta
							if shooting_delay_timer >= shooting_delay:
								# Ready to shoot
								is_preparing_to_shoot = false
								current_state = EnemyState.SHOOTING
								state_timer = 0.0
								shoot_at_player()
					else:
						is_preparing_to_shoot = false  # Reset preparation if player moves out of range
						set_movement_target(Global.player.global_position)
						move_to_target()
				else:
					reset_to_idle()
					
			EnemyState.SHOOTING:
				state_timer += delta
				if state_timer >= shooting_pause_time:
					current_state = EnemyState.CHASING
					shooting_timer = current_cooldown - rng.randf_range(0, 0.2)
		
		move_and_slide()

func shoot_at_player() -> void:
	if Global.player:
		shooting_timer = 0.0
		
		randomize_shooting_cooldown()
		
		var projectile: EnemyProjectile = projectile_resource.instantiate()
		Global.projectiles_scene.add_child(projectile)
		projectile.global_position = global_position
		
		var direction = global_position.direction_to(Global.player.global_position)
		projectile.direction = direction
		
		update_animation(direction)

func reset_to_idle() -> void:
	is_chasing = false
	current_state = EnemyState.IDLE
	state_timer = 0.0
	shooting_timer = current_cooldown
	velocity = Vector2.ZERO
	animated_sprite_2d.play("IDLE")

func choose_random_target() -> void:
	var random_angle = rng.randf_range(0, TAU)
	var random_distance = rng.randf_range(0, wander_range)
	var random_offset = Vector2(
		cos(random_angle) * random_distance,
		sin(random_angle) * random_distance
	)
	
	var target_position = global_position + random_offset
	set_movement_target(target_position)

func set_movement_target(movement_target: Vector2) -> void:
	navigation_agent.set_target_position(movement_target)

func move_to_target() -> void:
	if navigation_agent.is_navigation_finished():
		return
		
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var direction: Vector2 = global_position.direction_to(next_path_position)
	
	velocity = direction * movement_speed
	
	update_animation(direction)

func update_animation(direction: Vector2) -> void:
	var abs_x = abs(direction.x)
	var abs_y = abs(direction.y)
	
	if abs_x == 0 and abs_y == 0:
		animated_sprite_2d.play("IDLE")
		
	elif abs_x > abs_y:
		if direction.x > 0:
			animated_sprite_2d.play("WALK_RIGHT")
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.play("WALK_LEFT")
			animated_sprite_2d.flip_h = false
			
	else:
		if direction.y > 0:
			animated_sprite_2d.play("WALK_DOWN")
		else:
			animated_sprite_2d.play("WALK_UP")

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity

func _on_aggro_area_body_entered(_body: Node2D) -> void:
	if _body.name == "Player":
		#print("player entered student area")
		is_chasing = true
		current_state = EnemyState.CHASING

func _on_aggro_area_body_exited(_body: Node2D) -> void:
	if _body.name == "Player":
		#print("player exited student area")
		reset_to_idle()
