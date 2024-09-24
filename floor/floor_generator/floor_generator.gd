class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var place_starting_room_program: String = Utils.read_file(Global.PLACE_STARTING_ROOM_PROGRAM_PATH)
var place_generic_room_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH)
var place_inner_hallway_program: String = Utils.read_file(Global.PLACE_INNER_HALLWAY_PROGRAM_PATH)

var room_counter: int = 0
var current_answer_set: Array
var done: bool = false

func _ready() -> void:
	pass

func generate_floor():
	var current_floor: Floor = Floor.new()
	_generate_starting_room()
	
	
			
func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	return await worker.response.get("models")

func _copy_programs_to_temp() -> void:
	Utils.copy(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH, Global.PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP)
	Utils.copy(Global.PLACE_STARTING_ROOM_PROGRAM_PATH, Global.PLACE_STARTING_ROOM_PROGRAM_PATH_TEMP)
	Utils.copy(Global.PLACE_INNER_HALLWAY_PROGRAM_PATH, Global.PLACE_INNER_HALLWAY_PROGRAM_PATH_TEMP)
			
func _update_room_counter(_answer_set: Array) -> void:
	for atom: Dictionary in _answer_set:
		if atom.get("predicate").get("name") == "room_counter":
			room_counter = atom.get("arguments")[0].get("number")
			print("room_counter set to " + str(room_counter))	
			
			_answer_set.erase(atom)
			break
	
func _generate_starting_room():
	current_answer_set = await _get_answerset_from_worker(place_starting_room_program)
	var atoms: Array

	_update_room_counter(current_answer_set[0])
	atoms = Utils.change_atoms_to_old(Utils.get_atoms(current_answer_set[0]))
	print(atoms)
	
	# TODO: Add room to floor object

func _generate_room():
	pass
	
func _generate_doors():
	pass

func _check_if_done():
	done = true
