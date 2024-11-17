class_name EnemyProjectile
extends Entity

@export var speed: float = 100
@export var damage: int = 15
var direction: Vector2
var range: float = 3

const RANGE_PENALTY: int = 3

func _ready() -> void:
	SignalBus.student_damage_changed.connect(_on_student_damage_changed)
	animated_sprite_2d.play("BASIC")

func _process(_delta: float) -> void:
	position += direction * speed * _delta
	range -= _delta * RANGE_PENALTY
	
	collision = move_and_collide(velocity * _delta)
	
	if collision:
		_death_animation_start()
		velocity = velocity.slide(collision.get_normal()) / 2
	
	if range <= 0:
		_death_animation_start()
		queue_free()

func _on_student_damage_changed(amount: int) -> void:
	damage = amount

func _death_animation_start() -> void:
	animated_sprite_2d.play("DEATH")
	await animated_sprite_2d.animation_finished
