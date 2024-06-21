class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker

signal floor_generated
	
func generate_floor():
	print("Generating floor...")
	
	# Generate floor
	#TODO: get correct program string without escape
	var room_generator_program = Utils.read_file(Global.ROOM_GENERATOR_PROGRAM_PATH, true)
	
	worker.post(room_generator_program)
	await worker.response_ready
	print(worker.response)
	
	emit_signal("floor_generated")
	print("Floor generated")
