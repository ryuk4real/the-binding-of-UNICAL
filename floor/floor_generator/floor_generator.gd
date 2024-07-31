class_name FloorGenerator
extends Node2D

@onready var worker: Worker = $Worker
@onready var hallways_preloader = $"../Resources/HallwaysPreloader"
@onready var inner_hallways_preloader = $"../Resources/InnerHallwaysPreloader"
@onready var classrooms_preloader = $"../Resources/ClassroomsPreloader"
@onready var offices_preloader = $"../Resources/OfficesPreloader"
@onready var bathrooms_preloader = $"../Resources/BathroomsPreloader"
@onready var current_floor: Floor = preload("res://floor/floor.tscn").instantiate()

func generate_floor() -> Floor:
	
	var done: bool = false
	var answer_sets: Dictionary = {}
	var last_answer_set: Array
	
	var room_generator_program: String = Utils.read_file(Global.ROOM_GENERATOR_PROGRAM_PATH)
	var regex: RegEx = RegEx.new()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var iteration: int = 0
	var attempt: int = 0
	
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
				
					last_answer_set = answer_sets[iteration][random_position]
					
				if not done:
					var temp_path: String = Global.ASP_PATH + ".room_generator_temp_" + str(iteration + 1) + ".asp" 
					Utils.write_atoms(temp_path, current_room_atoms, room_generator_program)
					
					
					if iteration != 0:
						answer_sets[iteration].pop_at(random_position)
					
					iteration += 1
			else:
				answer_sets.erase(iteration)
				iteration -= 1
				var temp_path: String = Global.ASP_PATH + ".room_generator_temp_" + str(iteration) + ".asp" 
				room_generator_temp = Utils.read_file(temp_path)
			
			print("Iteration: " + str(iteration))
		
		attempt += 1
		
		
		if attempt >= 200:
			print("REDO -> Floor generator ATTEMPT: " + str(attempt))
			return null
			
		if done:
			print("Got valid answer set")
			print("Floor generator ATTEMPT: " + str(attempt))
			Utils.write_file("res://asp/.answer_set.json", str(last_answer_set))
			break
	
	return _get_floor_from_answer_set(last_answer_set)

func _get_floor_from_answer_set(_answer_set: Array = []) -> Floor:
	
	current_floor.reset()
	
	for atom: Dictionary in _answer_set:
		if atom.get("predicate").get("name") == "connected_old":
			var room_id1: int = atom.get("arguments")[0].get("number")
			var room_type1: int = atom.get("arguments")[1].get("number")
			var room_id2: int = atom.get("arguments")[2].get("number")
			var room_type2: int = atom.get("arguments")[3].get("number")
			var door_id1: int = atom.get("arguments")[4].get("number")
			var door_type1: int = atom.get("arguments")[5].get("number")
			var door_id2: int = atom.get("arguments")[7].get("number")
			var door_type2: int = atom.get("arguments")[8].get("number")
			
			var room1: Room = _get_room_from_preloader(room_id1, room_type1)
			var room2: Room = _get_room_from_preloader(room_id2, room_type2)
			
			room1.load_doors()
			room2.load_doors()
			
			var door1: Door = room1.get_door(door_id1, door_type1)
			var door2: Door = room2.get_door(door_id2, door_type2)
			
			current_floor.add_room(room1)
			current_floor.add_connection(room1, door1, room2, door2)
			
	
	#print(current_floor.connections)
		
	return current_floor

func _get_answerset_from_worker(_program: String):
	worker.post(_program)
	await SignalBus.response_ready
	return worker.response["models"]

func _get_room_from_preloader(_room_id: int, _room_type: int) -> Room:
	
	var room: Room
	
	match _room_type:
		Global.ROOM_TYPE_HALLWAY:
			room = hallways_preloader.get_resource(str(_room_id)).instantiate()
		Global.ROOM_TYPE_INNER_HALLWAY:
			room = inner_hallways_preloader.get_resource(str(_room_id)).instantiate()
		Global.ROOM_TYPE_CLASSROOM:
			room = classrooms_preloader.get_resource(str(_room_id)).instantiate()
		Global.ROOM_TYPE_OFFICE:
			room = offices_preloader.get_resource(str(_room_id)).instantiate()
		Global.ROOM_TYPE_BATHROOM:
			room = bathrooms_preloader.get_resource(str(_room_id)).instantiate()
			
	return room
