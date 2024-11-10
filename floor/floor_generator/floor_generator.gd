class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker
@onready var room_loader = $"../Resources/RoomLoader"
@onready var game_scene = $"../Game"

var hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var inner_hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var classroom_neighbour_type_guesser_program: String = Utils.read_file(Global.CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH)
var library_neighbour_type_guesser_program: String = Utils.read_file(Global.LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH)

var room_counter: int = 0
var done: bool = false
var map_center: Vector2i = Vector2i(Global.MAP_SIZE / 2, Global.MAP_SIZE / 2)

func _ready() -> void:
	pass

func generate_floor():
	var current_floor_packed_scene = preload("res://floor/floor.tscn")
	var current_floor: Floor = current_floor_packed_scene.instantiate()
	
	# All generation starts with a room of type HALLWAY with a random direction
	var available_directions = [Global.DIRECTION_UP, Global.DIRECTION_DOWN, Global.DIRECTION_LEFT, Global.DIRECTION_RIGHT]
	var random_direction: int = available_directions.pick_random()
	var first_room: Room = room_loader.get_random_room(Global.ROOM_TYPE_HALLWAY, Global.DIRECTION_DOWN)
	
	current_floor.visible = false
	game_scene.add_child(current_floor)
	
	current_floor.room_scene.add_child(first_room)
	current_floor.rooms_to_process.append(first_room)
	first_room.init(room_counter, Global.ROOM_TYPE_HALLWAY)
	
	if current_floor.can_place_room(first_room, map_center):
		current_floor.place_room(first_room, map_center)
		room_counter += 1
	
	#print(">>Rooms to process size: %s" % current_floor.rooms_to_process.size())
	
	# Add room limit check
	while not current_floor.rooms_to_process.is_empty() and room_counter < Global.ROOM_LIMIT:
		var room_to_process: Room = current_floor.rooms_to_process.pop_front()
		
		#print("\nChoosing room %s door types and availability" % [room_to_process.id])
		
		var unplaceable_doors: Array[Door] = []
		
		for door: Door in room_to_process.doors:
			if door.type == Global.ROOM_TYPE_NONE:
				door.type = await _get_room_neighbour_type(room_to_process.type)
			#print("> Door %s has type %s" % [door.id, door.type])
			#
			#print("Choosing position where to place the new room")
			
			if door.type != Global.ROOM_TYPE_NONE:
				door.is_placeholder = false
				var new_room: Room = room_loader.get_random_room(door.type, -door.direction)
				var new_position: Vector2i = _calculate_new_room_position(door.map_position, door.direction)
				
				print("Door %s of type %s from %s to %s" % [door.id, door.type, door.map_position, new_position])
				
				# Check room limit before attempting placement
				if room_counter >= Global.ROOM_LIMIT:
					unplaceable_doors.append(door)
					continue
					
				current_floor.room_scene.add_child(new_room)
				current_floor.rooms_to_process.append(new_room)
				
				print("Assigning type %s to room %s" % [door.type, room_counter])
				new_room.init(room_counter, door.type)
				
				if current_floor.can_place_room(new_room, new_position):
					current_floor.place_room(new_room, new_position)
					room_counter += 1
				else:
					current_floor.room_scene.remove_child(new_room)
					current_floor.rooms_to_process.erase(new_room)
					unplaceable_doors.append(door)
				
				#print(">>Rooms to process size: %s" % current_floor.rooms_to_process.size())
			print()
		
		# Handle unplaceable doors
		for door in unplaceable_doors:
			door.is_placeholder = true
			door.visible = false
		
		# If we've hit the room limit, clear the processing queue
		if room_counter >= Global.ROOM_LIMIT:
			current_floor.rooms_to_process.clear()
			
			# Make all remaining doors invisible
			for room in current_floor.rooms:
				for door in room.doors:
					if door.is_placeholder:
						door.visible = false
	
	for room: Room in current_floor.rooms:
		print("Room %s of type %s" % [room.id, room.type])
		
		for door: Door in room.doors:
			print("> has door %s of type %s" % [door.id, door.type])
	
	current_floor.print_floor()
	return current_floor

func _calculate_new_room_position(door_pos: Vector2i, direction: int) -> Vector2i:
	var new_pos = door_pos
	
	match direction:
		Global.DIRECTION_UP:
			new_pos.x -= 1
		Global.DIRECTION_DOWN:
			new_pos.x += 1
		Global.DIRECTION_LEFT:
			new_pos.y -= 1
		Global.DIRECTION_RIGHT:
			new_pos.y += 1
			
	return new_pos

func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	var response = await worker.response.get("models")
	worker.cancel_request()
	return response

func _get_room_neighbour_type(room_type: int) -> int:
	var type_answer_set: Array
	
	match(room_type):
		Global.ROOM_TYPE_HALLWAY:
			type_answer_set = await _get_answerset_from_worker(hallway_neighbour_type_guesser_program)
		
		Global.ROOM_TYPE_INNER_HALLWAY:
			type_answer_set = await _get_answerset_from_worker(inner_hallway_neighbour_type_guesser_program)
		
		Global.ROOM_TYPE_CLASSROOM:
			type_answer_set = await _get_answerset_from_worker(classroom_neighbour_type_guesser_program)
		
		Global.ROOM_TYPE_LIBRARY:
			type_answer_set = await _get_answerset_from_worker(library_neighbour_type_guesser_program)
		
		_:
			return Global.ROOM_TYPE_NONE

	return type_answer_set[0][0].get("arguments")[0].get("number")

func reset():
	room_counter = 0
