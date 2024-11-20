class_name Enemy
extends Entity

@onready var aggro_area: Area2D = $AggroArea
@onready var collision_shape: CollisionShape2D = $AggroArea/CollisionShape2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

enum EnemyState { IDLE, WANDERING, CHASING, DEAD, SHOOTING }

@export var max_hp: int = 100
@export var current_hp: int = 100
@export var damage: int = 10
@export var knockback_force: float = 30.0
@export var knockback_duration: float = 0.10

var is_being_knocked_back: bool = false
var knockback_direction: Vector2 = Vector2.ZERO
var knockback_timer: float = 0.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not enabled:
		return
		
	if is_being_knocked_back:
		knockback_timer -= delta
		velocity = knockback_direction * knockback_force
		
		if knockback_timer <= 0:
			is_being_knocked_back = false
			velocity = Vector2.ZERO
			knockback_direction = Vector2.ZERO
		
		move_and_slide()

func take_damage(amount: int, projectile_position: Vector2 = Vector2.ZERO) -> void:
	current_hp = max(0, current_hp - amount)
	
	# Apply knockback
	if projectile_position != Vector2.ZERO:
		apply_knockback(projectile_position)
	
	# Optional: Play hit animation or effects here
	if animated_sprite_2d:
		animated_sprite_2d.modulate = Color.RED
		# Reset color after a short delay
		await get_tree().create_timer(0.1).timeout
		animated_sprite_2d.modulate = Color.WHITE
	
	if current_hp <= 0:
		SignalBus.enemy_died.emit()
		die()

func apply_knockback(source_position: Vector2) -> void:
	knockback_direction = (global_position - source_position).normalized()
	knockback_timer = knockback_duration
	is_being_knocked_back = true
	velocity = knockback_direction * knockback_force  # Set initial velocity immediately
	move_and_slide()  # Apply initial push

func die() -> void:
	# TODO: Play death animation
	var current_room = Global.current_room
	
	if current_room:
		current_room.active_enemies -= 1
		current_room.check_room_clear()
	queue_free()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	if is_floor_transitioning:
		return
		
	# Check if the area belongs to a projectile
	var projectile = area.get_parent()
	if projectile is PlayerProjectile:
		take_damage(projectile.damage, projectile.global_position)
		projectile.queue_free()
