class_name Floor
extends Node2D

@onready var rooms_scene = $Rooms

var map: Array[Array]
var rooms: Array[Room] = []
var connections: Dictionary = {}
var current_room: Room

func init():
	_fill_map_with(0)

func _ready() -> void:
	pass

func _process(_delta) -> void:
	pass

func _fill_map_with(_value: int):
	map = []
	
	for i in range(0, Global.MAP_SIZE):
		map.append([])
		for j in range(0, Global.MAP_SIZE):
			map[i].append(_value)

func place_first_room(room: Room, x: int, y: int) -> void:
	pass
