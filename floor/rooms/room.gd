class_name Room
extends Node2D

@onready var doors: Array
@export var id: int
@export var type: int

var x_relative_position: int
var y_relative_position: int
# var cleaned_room_pickup


func _ready() -> void:
	pass

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
