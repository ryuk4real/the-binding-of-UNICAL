class_name Floor
extends Node2D

@onready var rooms_scene = $Rooms

var rooms: Array[Room] = []
var connections: Dictionary = {}
var current_room: Room

func _ready() -> void:
	
	current_room = find_room_with_type(Global.ROOM_TYPE_HALLWAY)
	rooms_scene.add_child(current_room, true, Node.INTERNAL_MODE_FRONT)

func _process(_delta) -> void:
	
	var door = await SignalBus.door_entered
	print(door)

func add_connection(_room1: Room, _door1: Door, _room2: Room, _door2: Door):
	connections[[_room1, _door1]] = [_room2, _door2]

func add_room(_room: Node) -> void:
	rooms.push_back(_room)

func find_room(_room: Room) -> Room:
	var room_index: int = rooms.find(_room)
	return rooms[room_index] if room_index != -1 else null

func find_room_with_type(_type: int) -> Room:
	for room in rooms:
		if room.type == _type:
			return room
	return null

func get_current_room() -> Room:
	return current_room

func set_current_room(_room: Room) -> void:
	current_room = _room

func go_to_room() -> void:
	pass

func reset():
	rooms.clear()
	connections.clear()
	current_room = null
