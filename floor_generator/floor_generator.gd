class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

signal floor_generated

var previous_answer_set: Array = []
var current_answer_set: Array = []

var regex = RegEx.new()
	
func generate_floor():
	
	var room_generator_program: String = Utils.read_file(Global.ROOM_GENERATOR_PROGRAM_PATH)
	var done: bool = false
	regex.compile("new")
	print("Generating floor...")
	
	Utils.copy(Global.ROOM_GENERATOR_PROGRAM_PATH, Global.ROOM_GENERATOR_TEMP_PATH)
	
	var room_generator_temp: String = Utils.read_file(Global.ROOM_GENERATOR_TEMP_PATH)
	
	var previous_room_atoms: Array = []
	var current_room_atoms: Array = []
	
	while(not done):
		
		room_generator_program = Utils.read_file(Global.ROOM_GENERATOR_TEMP_PATH)
		
		current_answer_set = await _get_answerset_from_worker(room_generator_program)
		
		if not current_answer_set.is_empty():
			for atom: Dictionary in current_answer_set[0]:
				
				if atom.get("predicate").get("name") != "n_new_rooms":
					var s = atom.get("str")
					s = regex.sub(s, "old")
					current_room_atoms.append(s)
			
			Utils.write_atoms(Global.ROOM_GENERATOR_TEMP_PATH, current_room_atoms, room_generator_temp)
			if not current_room_atoms.is_empty():
				previous_room_atoms = current_room_atoms.duplicate(true)
			previous_answer_set = current_answer_set.duplicate(true)
			current_room_atoms.clear()
			
		else:
			previous_answer_set.pop_front()
			
			if previous_answer_set.is_empty():
				done = true
			else:
				current_room_atoms.clear()
				current_answer_set = previous_answer_set.duplicate(true)
		
		
		if done:
			break
	
	#TODO: Create a floor object and fill it with the rooms
	
	print("Floor generated")
	

func _get_answerset_from_worker(program: String):
	worker.post(program)
	await worker.response_ready
	return worker.response["models"] 
