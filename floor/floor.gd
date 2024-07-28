class_name Floor
extends Node2D

var rooms: Array = []

func add_room(_room: Room) -> void:
	rooms.push_back(_room)

func find_room(_id: int, _type: int) -> Room:
	for room: Room in rooms:
		if room.id == _id and room.type == _type:
			return room
	
	return null
