class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var place_starting_room_program: String = Utils.read_file(Global.PLACE_STARTING_ROOM_PROGRAM_PATH)
var place_generic_room_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH)
var hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var inner_hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var classroom_neighbour_type_guesser_program: String = Utils.read_file(Global.CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH)
var library_neighbour_type_guesser_program: String = Utils.read_file(Global.LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH)


var room_counter: int = 0
var current_answer_set: Array
var done: bool = false

func _ready() -> void:
	pass

func generate_floor():
	var current_floor: Floor = Floor.new()
	_generate_starting_room()
	
	_generate_starting_room()
	
func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	var response = await worker.response.get("models")
	worker.cancel_request()
	return response

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
	
func _generate_doors(_answer_set: Array):
	pass
	
func _generate_starting_room():
	current_answer_set = await _get_answerset_from_worker(place_starting_room_program)
	
	_update_room_counter(current_answer_set[0])
	_generate_doors(current_answer_set[0])
	
	var atoms = Utils.change_atoms_to_old(Utils.get_atoms(current_answer_set[0]))
	print(atoms)
	
	return atoms

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
	
	print(type_answer_set[0][0].get("arguments")[0].get("number"))
	return type_answer_set[0][0].get("arguments")[0].get("number")
