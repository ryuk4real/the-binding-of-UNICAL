class_name Door
extends Area2D

@export var id: int
@export var type: int
@export var opened: bool = false
var direction: int

func _ready():
	set_door_direction(transform.get_rotation())

func open():
	$Sprite2D.frame = 0
	opened = true
	
func close():
	$Sprite2D.frame = 1
	opened = false

func set_door_direction(door_rotation: float) -> void:
	match door_rotation:
		0: direction = Global.DIRECTION_UP
		90: direction = Global.DIRECTION_RIGHT
		-90: direction = Global.DIRECTION_LEFT
		180: direction = Global.DIRECTION_DOWN
		
