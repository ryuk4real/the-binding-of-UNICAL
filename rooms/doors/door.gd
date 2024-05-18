extends Area2D

var opened: bool = false

var direction: int

func _ready():
	if Global.current_room.type == Global.ROOM_TYPE_HALLWAY:
		open()
	
	set_door_direction(transform.get_rotation())

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

func set_door_direction(door_rotation: float) -> void:
	match door_rotation:
		0: direction = Global.DIRECTION_UP
		90: direction = Global.DIRECTION_RIGHT
		-90: direction = Global.DIRECTION_LEFT
		180: direction = Global.DIRECTION_DOWN
		
