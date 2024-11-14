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
var projectile: Projectile

func _set_velocity_from_input() -> void:
	movement_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = movement_direction * speed

func _set_fire_direction_from_input() -> void:
	fire_direction = Input.get_vector("SHOOT_LEFT", "SHOOT_RIGHT", "SHOOT_DOWN", "SHOOT_UP")

func _ready() -> void:
	var projectile: Resource = load("res://entities/projectile/projectile.tscn")

func _process(_delta) -> void:
	pass


	
func _physics_process(_delta: float) -> void:
	move(_delta)

func _update_animation():
	
	if velocity == Vector2.ZERO:
		animated_sprite_2d.play("IDLE")
	else:
		var direction = "DOWN"
		if velocity.x < 0: direction = "LEFT"
		elif velocity.x > 0: direction = "RIGHT"
		elif velocity.y < 0: direction = "UP"
		
		animated_sprite_2d.play("WALK_" + direction)

func move(_delta: float) -> void:
	_set_velocity_from_input()
	_set_fire_direction_from_input()
	collision = move_and_collide(velocity * _delta)
	
	if collision:
		velocity = velocity.slide(collision.get_normal())
	
	_update_animation()

func shoot():
	var projectile = load("res://entities/projectile/projectile.tscn").instantiate()
	projectile.global_position = global_position
	projectile.rotation = global_rotation
	get_parent().add_child(projectile)
