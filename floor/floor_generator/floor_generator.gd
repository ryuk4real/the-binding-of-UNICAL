class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var place_starting_room_program: String = Utils.read_file(Global.PLACE_STARTING_ROOM_PROGRAM_PATH)
var place_generic_room_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH)

var current_floor: Floor = Floor.new()
var starting_room: Room

var used_coordinates: Dictionary
var room_counter: int = 0

var current_answer_set: Array

var done: bool = false

func _ready() -> void:
	pass

func generate_floor() -> Floor:
	
	_copy_programs_to_temp()
	used_coordinates.clear()
	
	while not done:
		_generate_new_room()
		_check_if_done()
	
	_generate_inner_hallways()
	_assign_types_to_rooms()
	_check_valid_floor()
	
	return current_floor

func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	
	if worker.response.get("models") == null:
		return []
		
	return worker.response.get("models")

#func _get_starting_room_atoms() -> Array:
#	var starting_room_answerset: Array = await _get_answerset_from_worker(place_starting_room_program)
#	_set_used_coordinates(starting_room_answerset[0])
#	return Utils.change_atoms_to_old(Utils.get_atoms(starting_room_answerset[0]))

func _get_random_coordinates(center_coordinates: Vector2i, _radius: int) -> Vector2i:
	var theta: int = randi_range(0, 360)
	var theta_radiant: float = deg_to_rad(theta)
	var random_radius: float = sqrt(randi_range(0, _radius**2))
	var mask_coordinates: Vector2i = Vector2i(int(random_radius * cos(theta_radiant)), int(random_radius * sin(theta_radiant)))
	
	return center_coordinates + mask_coordinates
	
#func _get_generic_room_atoms(_old_room_atoms: Array) -> Array:
#	var coordinates: Vector2i = _get_random_coordinates(Global.CENTER_COORDINATES, Global.SPAWN_RADIUS)
#	
#	while used_coordinates.get(coordinates) != null:
#		coordinates = _get_random_coordinates(Global.CENTER_COORDINATES, Global.SPAWN_RADIUS)
#	
#	used_coordinates[coordinates] = true
#	
#	var spawn_coordinates_constants: String = "#const xr = " + str(coordinates.x) + ". #const yr = " + str(coordinates.y)
#	_old_room_atoms.append(spawn_coordinates_constants)
#	Utils.write_atoms(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP, _old_room_atoms, place_generic_room_program)
#	
#	var temp_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP)
#	var new_room_answerset: Array = await _get_answerset_from_worker(temp_program)
#	
#	if new_room_answerset.is_empty():
#		return []
#	
#	_set_used_coordinates(new_room_answerset[0])
#	
#	return Utils.get_atoms(new_room_answerset[0], true)

func _copy_programs_to_temp() -> void:
	Utils.copy(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH, Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP)
	Utils.copy(Global.PLACE_STARTING_ROOM_PROGRAM_PATH, Global.PLACE_STARTING_ROOM_PROGRAM_PATH_TEMP)

func _set_used_coordinates(_answer_set: Array) -> void:
	for atom: Dictionary in _answer_set:
		if atom.get("predicate").get("name") == "placed_new":
			var arguments: Array = atom.get("arguments")
			var xr: int = arguments[3].get("number")
			var yr: int = arguments[4].get("number")
			
			used_coordinates[Vector2i(xr,yr)] = true
			print("Cell:" + str(xr) + "," + str(yr) + " has been used.")
			
func _set_room_counter(_answer_set: Array) -> void:
	for atom: Dictionary in _answer_set:
		if atom.get("predicate").get("name") == "room_counter":
			room_counter = atom.get("arguments")[0].get("number")
			print("room_counter set to " + str(room_counter))	
			
			_answer_set.erase(atom)
			break

func _get_answerset():
	pass
	
func _generate_new_room():
	
	if room_counter == 0:
		#TODO: handle first room generation
		pass
	
	#TODO: handle other room generation

func _generate_inner_hallways():
	pass

func _assign_types_to_rooms():
	pass

func _check_valid_floor():
	pass

func _check_if_done():
	pass
