class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker
@onready var room_loader = $"../Resources/RoomLoader"
@onready var game_scene = $"../Game"

var hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var inner_hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var classroom_neighbour_type_guesser_program: String = Utils.read_file(Global.CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH)
var library_neighbour_type_guesser_program: String = Utils.read_file(Global.LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH)
var enemy_type_guesser_program: String = Utils.read_file(Global.ENEMY_TYPE_GUESSER_PATH)
var current_room_atom: String
var map_center: Vector2i = Vector2i(Global.MAP_SIZE / 2, Global.MAP_SIZE / 2)


func _ready() -> void:
	Global.worker = worker

func generate_floor():
	var room_counter: int = 0
	var enemy_counter: int = 0
	var current_floor_packed_scene = preload("res://floor/floor.tscn")
	var current_floor: Floor = current_floor_packed_scene.instantiate()
	
	# All generation starts with a room of type HALLWAY with a random direction
	var available_directions = [Global.DIRECTION_UP, Global.DIRECTION_DOWN, Global.DIRECTION_LEFT, Global.DIRECTION_RIGHT]
	var random_direction: int = available_directions.pick_random()
	var first_room: Room = room_loader.get_random_room(Global.ROOM_TYPE_HALLWAY,  Global.DIRECTION_DOWN)
	
	Global.current_room = first_room
	first_room.hide()
	
	current_floor.visible = false
	game_scene.add_child(current_floor)
	
	current_floor.room_scene.add_child(first_room)
	current_floor.rooms_to_process.append(first_room)
	first_room.init(room_counter, Global.ROOM_TYPE_HALLWAY)
	
	if current_floor.can_place_room(first_room, map_center):
		current_floor.place_room(first_room, map_center)
		room_counter += 1
	
	while not current_floor.rooms_to_process.is_empty() and room_counter < Global.ROOM_LIMIT:
		var room_to_process: Room = current_floor.rooms_to_process.pop_front()
		var unplaceable_doors: Array[Door] = []
		
		current_floor.current_room_atom = Utils.build_atom("current_room", [room_to_process.id, room_to_process.type])
		
		for door: Door in room_to_process.doors:
			if door:
				if door.id != 0:
					door.type = await _get_room_neighbour_type(room_to_process.type)
					
				if door.type != Global.ROOM_TYPE_NONE:
					door.is_placeholder = false
					var new_room: Room = room_loader.get_random_room(door.type, -door.direction)
					var new_position: Vector2i = _calculate_new_room_position(door.map_position, door.direction)
					
					# print("Door %s of type %s from %s to %s" % [door.id, door.type, door.map_position, new_position])
					
					if room_counter >= Global.ROOM_LIMIT:
						unplaceable_doors.append(door)
						continue
					
					current_floor.room_scene.add_child(new_room)
					current_floor.rooms_to_process.append(new_room)
					
					# print("Assigning type %s to room %s" % [door.type, room_counter])
					new_room.init(room_counter, door.type)
					
					if current_floor.can_place_room(new_room, new_position):
						current_floor.place_room(new_room, new_position)
						
						door.setup_door_sprite(room_to_process.id)
						door.show()
						
						# Find the connecting door in the new room (door with id 0)
						var connecting_door: Door = new_room.find_door(0)
						if connecting_door:
							# Add the connection between the doors
							room_to_process.add_connection(door, connecting_door, new_room)
							new_room.add_connection(connecting_door, door, room_to_process)
							#print("Connected door %s from room %s to door %s from room %s" % 
							#	  [door.id, room_to_process.id, connecting_door.id, new_room.id])
						
						# For each room spawner guess the enemy to spawn (if any) and spawn it
						for spawner: Node2D in new_room.enemy_spawners.get_children():
							var enemy_id = await _get_enemy_type()
							
							if enemy_id != Global.ENEMY_TYPE_NONE:
								var enemy_atom: String = Utils.build_atom("enemy", [new_room.id, enemy_counter])
								current_floor.atoms.append(enemy_atom)
								spawner.spawn(enemy_id)
								
								enemy_counter += 1
							
						new_room.set_active_enemies_counter()
						
						# Now that a room is placed I add the atoms of the neighbours of the room to process
						var neighbour_atom: String = Utils.build_atom("neighbours", [room_to_process.id, new_room.id])
						current_floor.atoms.append(neighbour_atom)
						
						room_counter += 1
					else:
						current_floor.room_scene.remove_child(new_room)
						current_floor.rooms_to_process.erase(new_room)
						
						if new_room.id != 0:
							if door.id != 0:
								door.is_placeholder = true
								door.type = Global.ROOM_TYPE_NONE
		
		# Add the current room to floor atoms
		var room_atom: String = Utils.build_atom("room", [room_to_process.id, room_to_process.type])
		current_floor.atoms.append(room_atom)

		# Handle unplaceable doors
		for door: Door in unplaceable_doors:
			if door != null:
				#print("Unplaceable door id: %s type %s placeholder %s" % [door.id, door.type, door.is_placeholder])
				if door.id != 0:
					door.is_placeholder = true
				door.hide()
		
		# If we've hit the room limit, clear the processing queue
		if room_counter >= Global.ROOM_LIMIT:
			current_floor.rooms_to_process.clear()
			
			# Make all remaining doors invisible
			for room: Room in current_floor.rooms:
				for door in room.doors:
					if door != null:
						if door.is_placeholder:
							door.hide()
		
		# Avoid collision handling by scattering room globally
		
		var count: int = 0
		for room: Room in current_floor.rooms:
			room.global_position = Vector2(800.0 * count, 0)
			count += 1
			
	print(current_floor.atoms)
	print()
	
	Global.current_room.set_door_visible()
	current_floor.print_room_connections()
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
	await worker.response
	var response = worker.response.get("models")
	return response

func _get_room_neighbour_type(room_type: int, _floor_atoms: Array[String] = []) -> int:
	var type_answer_set: Array
	var program: String
	
	for atom: String in _floor_atoms:
		program += atom
		
	program += current_room_atom
	
	match(room_type):
		Global.ROOM_TYPE_HALLWAY:
			program += hallway_neighbour_type_guesser_program
			type_answer_set = await _get_answerset_from_worker(program)
		
		Global.ROOM_TYPE_INNER_HALLWAY:
			program += inner_hallway_neighbour_type_guesser_program
			type_answer_set = await _get_answerset_from_worker(program)
		
		Global.ROOM_TYPE_CLASSROOM:
			program += inner_hallway_neighbour_type_guesser_program
			type_answer_set = await _get_answerset_from_worker(program)
		
		Global.ROOM_TYPE_LIBRARY:
			program += library_neighbour_type_guesser_program
			type_answer_set = await _get_answerset_from_worker(program)

	return type_answer_set[0][0].get("arguments")[0].get("number")

func _get_enemy_type(_floor_atoms: Array = []) -> int:
	var enemy_answerset: Array
	var program: String = enemy_type_guesser_program
	
	program += current_room_atom

	for atom: String in _floor_atoms:
		program += atom
	
	enemy_answerset = await _get_answerset_from_worker(enemy_type_guesser_program)
	return enemy_answerset[0][0].get("arguments")[0].get("number")
