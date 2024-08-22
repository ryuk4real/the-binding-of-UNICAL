class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

var place_starting_room_program: String = Utils.read_file(Global.PLACE_STARTING_ROOM_PROGRAM_PATH)
var place_generic_room_program: String = Utils.read_file(Global.PLACE_GENERIC_ROOM_PROGRAM_PATH)

func _ready() -> void:
	pass

func generate_floor() -> void:
	var first_room_atoms: Array = await _get_first_room_atoms()
	

func _get_answerset_from_worker(_program: String) -> Array:
	worker.post(_program)
	await SignalBus.response_ready
	return worker.response["models"]

func _get_first_room_atoms() -> Array:
	var spawn_room_answerset: Array
	spawn_room_answerset = await _get_answerset_from_worker(place_starting_room_program)
	print(spawn_room_answerset)
	return Utils.change_atoms_to_old(Utils.get_atoms(spawn_room_answerset[0]))
