class_name Player
extends Entity

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: CollisionShape2D = $Hitbox
@onready var camera_2d: Camera2D = $Camera2D
@onready var interaction_area_collision_shape: CollisionShape2D = $InteractionArea/CollisionShape2D

@export var speed: float = 90.0
@export var friction: float = 300.0

var movement_direction: Vector2
var fire_direction: Vector2
var projectile_resource: Resource

var shoot_delay: float = 0.2
var current_delay: float = 0.0
var max_delay: float = 0.5
var delay_recovery: float = 0.3
var can_shoot: bool = true

func _set_velocity_from_input() -> void:
	movement_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = movement_direction * speed

func _set_fire_direction_from_input() -> void:
	# Check for opposing directions
	var shooting_left = Input.is_action_pressed("SHOOT_LEFT")
	var shooting_right = Input.is_action_pressed("SHOOT_RIGHT")
	var shooting_up = Input.is_action_pressed("SHOOT_UP")
	var shooting_down = Input.is_action_pressed("SHOOT_DOWN")
	
	# If opposing directions are pressed, set fire_direction to zero
	if (shooting_left and shooting_right) or (shooting_up and shooting_down):
		fire_direction = Vector2.ZERO
		return
	
	# Otherwise, use get_vector for smooth diagonal movement
	fire_direction = Input.get_vector("SHOOT_LEFT", "SHOOT_RIGHT", "SHOOT_UP", "SHOOT_DOWN")
	
	# Normalize the vector if it's not zero
	if fire_direction != Vector2.ZERO:
		fire_direction = fire_direction.normalized()

func _ready() -> void:
	projectile_resource = load("res://entities/projectile/projectile.tscn")

func _process(delta) -> void:
	# Handle delay recovery
	if current_delay > shoot_delay:
		current_delay = max(shoot_delay, current_delay - delay_recovery * delta)
	
	# Update can_shoot status
	can_shoot = current_delay <= 0

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
	if current_delay > 0:
		current_delay -= _delta
	
	if fire_direction != Vector2.ZERO and current_delay <= 0:
		var projectile: Projectile = projectile_resource.instantiate()
		projectile.global_position = global_position
		
		# Set rotation based on fire_direction angle
		projectile.rotation = fire_direction.angle()
		
		# Ensure direction is normalized
		projectile.direction = fire_direction.normalized()
		
		Global.projectiles_scene.add_child(projectile)
		
		# Increase delay for next shot
		current_delay = min(current_delay + shoot_delay, max_delay)
