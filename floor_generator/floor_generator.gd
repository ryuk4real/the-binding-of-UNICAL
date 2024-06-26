class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

signal floor_generated
var room_atoms: String
	
func generate_floor():
	print("Generating floor...")
	
	var room_generator_program = Utils.read_file(Global.ROOM_GENERATOR_PROGRAM_PATH)
	
	# TODO: Loop until floor completed using worker.response
	var done: bool = false
	
	while(!done):
		
		
		
		worker.post(room_generator_program)
		await worker.response_ready
		
		done = true
	
	
	
	emit_signal("floor_generated")
	print("Floor generated")
