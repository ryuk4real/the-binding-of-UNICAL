extends Area2D

var opened: bool = false

# The direction of the room the door is connected with
const UP: int = 0
const RIGHT: int = 1
const DOWN: int = 2
const LEFT: int = 3

@export var goes_to: int

func _ready():
	if Global.current_room.type == Global.ROOM_TYPE_HALLWAY:
		open()

func open():
	$Sprite2D.frame = 0
	$OpenDoorCollider.visible = true
	$ClosedDoorCollider.visible = false
	opened = true
	
func close():
	$Sprite2D.frame = 1
	$ClosedDoorCollider.visible = true
	$OpenDoorCollider.visible = false
	opened = false
