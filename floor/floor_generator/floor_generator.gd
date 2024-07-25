class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker
@onready var hallways_preloader = $"../Resources/HallwaysPreloader"
@onready var inner_hallways_preloader = $"../Resources/InnerHallwaysPreloader"
@onready var classrooms_preloader = $"../Resources/ClassroomsPreloader"
@onready var offices_preloader = $"../Resources/OfficesPreloader"
@onready var bathrooms_preloader = $"../Resources/BathroomsPreloader"

func generate_floor():
	
	var done: bool = false
	var redo: bool = false
	var answer_sets: Dictionary = {}
	var last_answer_set: Array
	
	var room_generator_program: String = Utils.read_file(Global.ROOM_GENERATOR_PROGRAM_PATH)
	var regex: RegEx = RegEx.new()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var iteration: int = 0
	
	Utils.copy(Global.ROOM_GENERATOR_PROGRAM_PATH, Global.FIRST_ROOM_GENERATOR_TEMP_PATH)
	var room_generator_temp: String = Utils.read_file(Global.FIRST_ROOM_GENERATOR_TEMP_PATH)
	regex.compile("new")
	
	while not done:
		
		var current_room_atoms: Array[String] = []
		
		if not answer_sets.has(iteration):
			var temp_path: String = Global.ASP_PATH + ".room_generator_temp_" + str(iteration) + ".asp" 
			room_generator_temp = Utils.read_file(temp_path)
			answer_sets[iteration] = await _get_answerset_from_worker(room_generator_temp)
		else:
			
			if not answer_sets[iteration].is_empty():
				
				var answer_set_size: int = answer_sets[iteration].size()
				var random_position: int = rng.randi_range(0, (answer_set_size - 1))
				
				for atom: Dictionary in answer_sets[iteration][random_position]:
					if atom.get("predicate").get("name") == "n_new_rooms":
						if atom.get("arguments")[0].get("number") == 0:
							done = true
							break
					else:
						var s = atom.get("str")
						s = regex.sub(s, "old")
						current_room_atoms.append(s)
				
				if not done:
					var temp_path: String = Global.ASP_PATH + ".room_generator_temp_" + str(iteration + 1) + ".asp" 
					Utils.write_atoms(temp_path, current_room_atoms, room_generator_program)
					
					last_answer_set = answer_sets[iteration][random_position]
					
					if iteration != 0:
						answer_sets[iteration].pop_at(random_position)
					
					iteration += 1
			else:
				answer_sets.erase(iteration)
				iteration -= 1
				var temp_path: String = Global.ASP_PATH + ".room_generator_temp_" + str(iteration) + ".asp" 
				room_generator_temp = Utils.read_file(temp_path)
			
			print("Iteration: " + str(iteration))
			
		if done:
			Utils.write_file("res://asp/.answer_set.json", str(last_answer_set))
			break
	
	print("Floor generated")
		
	
func _get_answerset_from_worker(_program: String):
	worker.post(_program)
	await SignalBus.response_ready
	return worker.response["models"] 
