class_name Player
extends Entity

@onready var camera_2d: Camera2D = $Camera2D
@onready var interaction_area_collision_shape: CollisionShape2D = $InteractionArea/CollisionShape2D

@export var speed: float = 75.0
@export var max_hp: int
@export var shoot_delay: float = 0.4
@export var shot_speed: float = 100.0
@export var damage: int = 10

var friction: float = 300.0
var movement_direction: Vector2
var fire_direction: Vector2
var projectile_resource: Resource
var current_hp: int
var is_hurt: bool
var current_shot_delay: float = 0.0
var max_shot_delay: float = 1.0
var shot_delay_recovery: float = 0.3
var max_shot_speed: float = 200
var can_shoot: bool = true
var damage_cooldown_duration: float = 2.0
var flash_frequency: float = 0.1
var damage_cooldown_timer: float = 0.0
var is_invulnerable: bool = false
var enemy_in_area: Enemy = null
var max_speed: float = 150

var coins: int
var keys: int

func _ready() -> void:
	projectile_resource = load("res://entities/player_projectile/player_projectile.tscn")
	_set_player_active(true)
	
	current_hp = max_hp
	SignalBus.player_health_changed.emit()
	SignalBus.player_damage_changed.emit()

func _process(delta) -> void:
	# Shot delay recovery
	if current_shot_delay > shoot_delay:
		current_shot_delay = max(shoot_delay, current_shot_delay - shot_delay_recovery * delta)
	
	can_shoot = current_shot_delay <= 0
	
	if is_invulnerable:
		damage_cooldown_timer -= delta
		
		# Visual flash effect after hit
		var alpha = 1.0 if fmod(damage_cooldown_timer, flash_frequency * 2) < flash_frequency else 0.5
		animated_sprite_2d.modulate.a = alpha
		
		if damage_cooldown_timer <= 0:
			is_invulnerable = false
			animated_sprite_2d.modulate.a = 1.0
	
	if enemy_in_area and not is_invulnerable:
		take_damage(enemy_in_area.damage)
	
	if current_hp <= 0:
		SignalBus.player_health_reached_zero.emit()
		_set_player_active(false)

func can_collect(collectible: Collectible) -> bool:
	match collectible.collectible_type:
		Collectible.CollectibleType.HEALTH:
			return needs_healing()
		Collectible.CollectibleType.COIN:
			return true
		Collectible.CollectibleType.KEY:
			return true
		Collectible.CollectibleType.POWER_UP:
			return true
		_:
			print("cannot collect")
			return false

func needs_healing() -> bool:
	return current_hp < max_hp

func heal(amount: float) -> void:
	current_hp = min(current_hp + amount, max_hp)
	SignalBus.player_health_changed.emit()

func add_coins(amount: int) -> void:
	coins += amount

func add_key(amount: int) -> void:
	keys += amount

func has_key(key_id: String) -> bool:
	return keys

func take_damage(amount: int) -> void:
	if is_invulnerable:
		return
		
	current_hp = max(0, current_hp - amount)
	SignalBus.player_health_changed.emit()
	
	is_invulnerable = true
	damage_cooldown_timer = damage_cooldown_duration

func _set_velocity_from_input() -> void:
	movement_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = movement_direction * speed

func _set_fire_direction_from_input() -> void:
	var shooting_left = Input.is_action_pressed("SHOOT_LEFT")
	var shooting_right = Input.is_action_pressed("SHOOT_RIGHT")
	var shooting_up = Input.is_action_pressed("SHOOT_UP")
	var shooting_down = Input.is_action_pressed("SHOOT_DOWN")
	
	if (shooting_left and shooting_right) or (shooting_up and shooting_down):
		fire_direction = Vector2.ZERO
		return
	
	fire_direction = Input.get_vector("SHOOT_LEFT", "SHOOT_RIGHT", "SHOOT_UP", "SHOOT_DOWN")
	
	if fire_direction != Vector2.ZERO:
		fire_direction = fire_direction.normalized()


func _physics_process(_delta: float) -> void:
	move(_delta)
	shoot(_delta)

func _update_animation():
	if velocity == Vector2.ZERO:
		animated_sprite_2d.play("IDLE")
	else:
		var direction = "DOWN"
		
		if velocity.x < 0: direction = "LEFT"
		elif velocity.x > 0: direction = "RIGHT"
		elif velocity.y < 0: direction = "UP"
		
		if fire_direction.x > 0: direction = "RIGHT"
		elif fire_direction.x < 0: direction = "LEFT"
		elif fire_direction.y > 0: direction = "DOWN"
		elif fire_direction.y < 0: direction = "UP"
		
		animated_sprite_2d.play("WALK_" + direction)

func move(_delta: float) -> void:
	_set_velocity_from_input()
	collision = move_and_collide(velocity * _delta)
	
	if collision:
		velocity = velocity.slide(collision.get_normal())
	
	_update_animation()

func shoot(_delta: float) -> void:
	_set_fire_direction_from_input()
	
	# Update delay timer
	if current_shot_delay > 0:
		current_shot_delay -= _delta
	
	if fire_direction != Vector2.ZERO and current_shot_delay <= 0:
		var projectile: PlayerProjectile = projectile_resource.instantiate()
		projectile.global_position = global_position
		
		# Set rotation based on fire_direction angle
		projectile.rotation = fire_direction.angle()
		
		# Ensure direction is normalized
		projectile.direction = fire_direction.normalized()
		
		# Set the projectile's speed based on the player's shot_speed
		projectile.speed = shot_speed
		
		Global.projectiles_scene.add_child(projectile)
		
		# Increase delay for next shot
		current_shot_delay = min(current_shot_delay + shoot_delay, max_shot_delay)

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body is Enemy:
		enemy_in_area = body
	
	if body is Stairs:
		SignalBus.go_to_next_floor.emit()

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body is Enemy:
		if body == enemy_in_area:
			enemy_in_area = null

func _set_player_active(active: bool) -> void:
	set_process_input(active)
	set_physics_process(active)
	set_process(active)
