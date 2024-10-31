class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var inner_hallway_neighbour_type_guesser_program: String = Utils.read_file(Global.INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH)
var classroom_neighbour_type_guesser_program: String = Utils.read_file(Global.CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH)
var library_neighbour_type_guesser_program: String = Utils.read_file(Global.LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH)


var room_counter: int = 0
var done: bool = false

func _ready() -> void:
	pass

func generate_floor():
	var current_floor: Floor = Floor.new()
	current_floor.init()
	
	
func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	var response = await worker.response.get("models")
	worker.cancel_request()
	return response
	
func _generate_doors(_answer_set: Array):
	pass

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
