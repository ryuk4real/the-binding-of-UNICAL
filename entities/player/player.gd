class_name Player
extends Entity

@export var speed: float = 300.0

func move(delta: float) -> void:
	var input: Vector2 = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	input = input.normalized()
	position += input * delta * speed

func _ready() -> void:
	pass

func _process(delta) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move(delta)
