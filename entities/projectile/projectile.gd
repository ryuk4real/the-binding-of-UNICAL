class_name Projectile
extends Entity

@export var speed: float = 100
var direction: Vector2
var damage_on_hit: int
var range: float = 3

const RANGE_PENALTY: int = 2

func _process(_delta: float) -> void:
	position += direction * speed * _delta
	range -= _delta * RANGE_PENALTY
	
	if range <= 0:
		#TODO: Instead of queue_free righe away make it collapse
		queue_free()
	
	collision = move_and_collide(velocity * _delta)
	
	if collision:
		velocity = velocity.slide(collision.get_normal())
