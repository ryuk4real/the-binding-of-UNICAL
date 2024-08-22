class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var place_starting_room_program: String = Utils.read_file(Global.PLACE_STARTING_ROOM_PROGRAM_PATH)
var place_generic_room_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH)

var current_floor: Floor = Floor.new()
var starting_room: Room

func _ready() -> void:
	pass

func generate_floor() -> void:
	
	_copy_programs_to_temp()
	
	var first_room_atoms: Array = await _get_first_room_atoms()
	Utils.change_atoms_to_old(first_room_atoms)
	Utils.write_atoms(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP, first_room_atoms, place_generic_room_program)
	
	print(first_room_atoms)
	
	var new_room_atoms: Array = await _get_new_room_atoms(first_room_atoms)
	print(new_room_atoms)
	

func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	return worker.response["models"]

func _get_first_room_atoms() -> Array:
	var spawn_room_answerset: Array = await _get_answerset_from_worker(place_starting_room_program)
	return Utils.change_atoms_to_old(Utils.get_atoms(spawn_room_answerset[0]))

func _get_random_coordinates(center_coordinates: Vector2i, _radius: int) -> Vector2i:
	var theta = randi_range(0, 360)
	var theta_radiant = deg_to_rad(theta)
	var random_radius: float = sqrt(randi_range(0, _radius**2))
	var coordinates: Vector2i = Vector2i(int(random_radius * cos(theta_radiant)), int(random_radius * sin(theta_radiant)))
	return center_coordinates + coordinates

func _get_new_room_atoms(_old_room_atoms: Array):
	
	var coordinates: Vector2i = _get_random_coordinates(Global.CENTER_COORDINATES, Global.SPAWN_RADIUS)
	var spawn_coordinates_constants = "#const xr = " + str(coordinates.x) + ". #const yr = " + str(coordinates.y)
	_old_room_atoms.append(spawn_coordinates_constants)
	Utils.write_atoms(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP, _old_room_atoms, place_generic_room_program)
	
	var temp_program = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP)
	var new_room_answerset: Array = await _get_answerset_from_worker(temp_program)
	return Utils.get_atoms(new_room_answerset[0], true)
	
func _copy_programs_to_temp():
	Utils.copy(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH, Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP)
	Utils.copy(Global.PLACE_STARTING_ROOM_PROGRAM_PATH, Global.PLACE_STARTING_ROOM_PROGRAM_PATH_TEMP)
	
	
