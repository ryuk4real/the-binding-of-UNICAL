class_name Room
extends Node2D

@onready var doors: Array
@export var id: int
@export var type: int

var x_relative_position: int
var y_relative_position: int
var is_clear: bool = true

func _ready() -> void:
	
	if doors.is_empty():
		load_doors()
	
	if type == Global.ROOM_TYPE_HALLWAY:
		open_all_doors()
	
	if is_clear:
		open_all_doors()
	else:
		close_all_doors()

func load_doors() -> void:
	for door: Door in $Doors.get_children():
		doors.append(door)

func get_door(_door_id: int, _door_type: int) -> Door:
	for door in doors:
		if door.id == _door_id and door.type == _door_type:
			return door
	return null

func set_relative_position(_x_relative_position: int, _y_relative_position: int) -> void:
	x_relative_position = _x_relative_position
	y_relative_position = _y_relative_position

func open_all_doors():
	for door: Door in doors:
		door.open()

func close_all_doors():
	for door: Door in doors:
		door.close()
