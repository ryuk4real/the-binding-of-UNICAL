class_name Zombie
extends Entity

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var movement_speed: float = 200.0
@export var wander_range: float = 50.0
@export var idle_time: float = 3.0
@export var wander_time: float = 4.0

enum ZombieState { IDLE, WANDERING, CHASING }

var current_state: ZombieState = ZombieState.IDLE
var state_timer: float = 0.0
var is_chasing: bool = false
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	navigation_agent.max_speed = movement_speed
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	animated_sprite_2d.play("IDLE")

func _physics_process(delta: float) -> void:
	if enabled:
		if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
			return
			
		if is_chasing:
			current_state = ZombieState.CHASING
		
		match current_state:
			ZombieState.IDLE:
				velocity = Vector2.ZERO
				state_timer += delta
				if state_timer >= idle_time:
					choose_random_target()
					current_state = ZombieState.WANDERING
					state_timer = 0.0
					
			ZombieState.WANDERING:
				state_timer += delta
				if state_timer >= wander_time:
					current_state = ZombieState.IDLE
					state_timer = 0.0
					velocity = Vector2.ZERO
					animated_sprite_2d.play("IDLE")
				else:
					move_to_target()
					if navigation_agent.is_navigation_finished():
						choose_random_target()
					
			ZombieState.CHASING:
				if Global.player:
					set_movement_target(Global.player.global_position)
					move_to_target()
				else:
					reset_to_idle()
		#print("enabled")
		move_and_slide()

# Helper function to reset zombie state
func reset_to_idle() -> void:
	is_chasing = false
	current_state = ZombieState.IDLE
	state_timer = 0.0
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
	
	velocity = direction * movement_speed * 4
	
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
		print("player entered area")
		is_chasing = true
		current_state = ZombieState.CHASING

func _on_aggro_area_body_exited(_body: Node2D) -> void:
	if _body.name == "Player":
		print("player exited area")
		reset_to_idle()
