class_name EnemyProjectile
extends Entity

@export var speed: float = 100
@export var damage: int = 10
var direction: Vector2
var range: float = 3
var is_dying: bool = false

const RANGE_PENALTY: int = 3

func _ready() -> void:
	SignalBus.student_damage_changed.connect(_on_student_damage_changed)
	animated_sprite_2d.play("BASIC")

func _process(delta: float) -> void:
	if is_floor_transitioning or is_dying:
		return
		
	position += direction * speed * delta
	range -= delta * RANGE_PENALTY
	
	collision = move_and_collide(velocity * delta)
	
	if collision:
		_death_animation_start()
	
	if range <= 0:
		_death_animation_start()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if is_floor_transitioning:
		return
		
	if body is Player:
		body.take_damage(damage)
		_death_animation_start()

func _on_student_damage_changed(amount: int) -> void:
	damage = amount
	update_projectile_scale()

func _death_animation_start() -> void:
	if is_dying:
		return
		
	is_dying = true
	animated_sprite_2d.play("DEATH")
	await animated_sprite_2d.animation_finished
	queue_free()

func update_projectile_scale() -> void:
	if damage > 20 and damage <= 50:
		scale += Vector2(0.1, 0.1)
	elif damage >= 50 and damage < 75:
		scale += Vector2(0.2, 0.2)
	elif damage >= 75:
		scale += Vector2(0.3, 0.3)
