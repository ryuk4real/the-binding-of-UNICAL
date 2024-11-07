extends Node2D

var hallway_up_loader: ResourcePreloader
var hallway_down_loader: ResourcePreloader
var hallway_right_loader: ResourcePreloader
var hallway_left_loader: ResourcePreloader

var inner_hallway_down_loader: ResourcePreloader
var inner_hallway_up_loader: ResourcePreloader
var inner_hallway_left_loader: ResourcePreloader
var inner_hallway_right_loader: ResourcePreloader

var bathroom_up_loader: ResourcePreloader
var bathroom_down_loader: ResourcePreloader
var bathroom_right_loader: ResourcePreloader
var bathroom_left_loader: ResourcePreloader

var lab_up_loader: ResourcePreloader
var lab_down_loader: ResourcePreloader
var lab_right_loader: ResourcePreloader
var lab_left_loader: ResourcePreloader

var standard_classroom_up_loader: ResourcePreloader
var standard_classroom_down_loader: ResourcePreloader
var standard_classroom_right_loader: ResourcePreloader
var standard_classroom_left_loader: ResourcePreloader

var office_up_loader: ResourcePreloader
var office_down_loader: ResourcePreloader
var office_right_loader: ResourcePreloader
var office_left_loader: ResourcePreloader

var library_up_loader: ResourcePreloader
var library_down_loader: ResourcePreloader
var library_right_loader: ResourcePreloader
var library_left_loader: ResourcePreloader

var storage_up_loader: ResourcePreloader
var storage_down_loader: ResourcePreloader
var storage_right_loader: ResourcePreloader
var storage_left_loader: ResourcePreloader

func _ready() -> void:
	hallway_up_loader = ResourcePreloader.new()
	hallway_down_loader = ResourcePreloader.new()
	hallway_left_loader = ResourcePreloader.new()
	hallway_right_loader = ResourcePreloader.new()
	
	inner_hallway_up_loader = ResourcePreloader.new()
	inner_hallway_down_loader = ResourcePreloader.new()
	inner_hallway_left_loader = ResourcePreloader.new()
	inner_hallway_right_loader = ResourcePreloader.new()
	
	bathroom_up_loader = ResourcePreloader.new()
	bathroom_down_loader = ResourcePreloader.new()
	bathroom_left_loader = ResourcePreloader.new()
	bathroom_right_loader = ResourcePreloader.new()
	
	lab_up_loader = ResourcePreloader.new()
	lab_down_loader = ResourcePreloader.new()
	lab_left_loader = ResourcePreloader.new()
	lab_right_loader = ResourcePreloader.new()

	standard_classroom_up_loader = ResourcePreloader.new()
	standard_classroom_down_loader = ResourcePreloader.new()
	standard_classroom_left_loader = ResourcePreloader.new()
	standard_classroom_right_loader = ResourcePreloader.new()
	
	office_up_loader = ResourcePreloader.new()
	office_down_loader = ResourcePreloader.new()
	office_left_loader = ResourcePreloader.new()
	office_right_loader = ResourcePreloader.new()
	
	library_up_loader = ResourcePreloader.new()
	library_down_loader = ResourcePreloader.new()
	library_left_loader = ResourcePreloader.new()
	library_right_loader = ResourcePreloader.new()
	
	storage_up_loader = ResourcePreloader.new()
	storage_down_loader = ResourcePreloader.new()
	storage_left_loader = ResourcePreloader.new()
	storage_right_loader = ResourcePreloader.new()
	
func load_resources() -> void:
	
	# HALLWAYS ROOM LOADERS INIT
	for i in range(0, Global.HALLWAY_ROOM_UP_COUNTER):
		hallway_up_loader.add_resource(str(i), load(Global.HALLWAY_UP_FOLDER_PATH + str(i) + "_up.tscn"))

	for i in range(0, Global.HALLWAY_ROOM_DOWN_COUNTER):
		hallway_down_loader.add_resource(str(i), load(Global.HALLWAY_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))

	for i in range(0, Global.HALLWAY_ROOM_LEFT_COUNTER):
		hallway_left_loader.add_resource(str(i), load(Global.HALLWAY_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))
	
	for i in range(0, Global.HALLWAY_ROOM_RIGHT_COUNTER):
		hallway_right_loader.add_resource(str(i), load(Global.HALLWAY_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))


	# INNER HALLWAYS ROOM LOADERS
	for i in range(0, Global.INNER_HALLWAY_ROOM_UP_COUNTER):
		inner_hallway_up_loader.add_resource(str(i), load(Global.INNER_HALLWAY_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.INNER_HALLWAY_ROOM_DOWN_COUNTER):
		inner_hallway_down_loader.add_resource(str(i), load(Global.INNER_HALLWAY_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))

	for i in range(0, Global.INNER_HALLWAY_ROOM_RIGHT_COUNTER):
		inner_hallway_right_loader.add_resource(str(i), load(Global.INNER_HALLWAY_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.INNER_HALLWAY_ROOM_LEFT_COUNTER):
		inner_hallway_left_loader.add_resource(str(i), load(Global.INNER_HALLWAY_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# BATHROOMS ROOM LOADERS
	for i in range(0, Global.BATHROOM_ROOM_UP_COUNTER):
		bathroom_up_loader.add_resource(str(i), load(Global.BATHROOM_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.BATHROOM_ROOM_DOWN_COUNTER):
		bathroom_down_loader.add_resource(str(i), load(Global.BATHROOM_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.BATHROOM_ROOM_RIGHT_COUNTER):
		bathroom_right_loader.add_resource(str(i), load(Global.BATHROOM_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.BATHROOM_ROOM_LEFT_COUNTER):
		bathroom_left_loader.add_resource(str(i), load(Global.BATHROOM_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# LAB ROOM LOADERS
	for i in range(0, Global.LAB_ROOM_UP_COUNTER):
		lab_up_loader.add_resource(str(i), load(Global.LAB_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.LAB_ROOM_DOWN_COUNTER):
		lab_down_loader.add_resource(str(i), load(Global.LAB_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.LAB_ROOM_RIGHT_COUNTER):
		lab_right_loader.add_resource(str(i), load(Global.LAB_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.LAB_ROOM_LEFT_COUNTER):
		lab_left_loader.add_resource(str(i), load(Global.LAB_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# CLASSROOM ROOM LOADERS
	for i in range(0, Global.STANDARD_CLASSROOM_ROOM_UP_COUNTER):
		standard_classroom_up_loader.add_resource(str(i), load(Global.STANDARD_CLASSROOM_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.STANDARD_CLASSROOM_ROOM_DOWN_COUNTER):
		standard_classroom_down_loader.add_resource(str(i), load(Global.STANDARD_CLASSROOM_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.STANDARD_CLASSROOM_ROOM_RIGHT_COUNTER):
		standard_classroom_right_loader.add_resource(str(i), load(Global.STANDARD_CLASSROOM_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.STANDARD_CLASSROOM_ROOM_LEFT_COUNTER):
		standard_classroom_left_loader.add_resource(str(i), load(Global.STANDARD_CLASSROOM_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# OFFICE ROOM LOADERS
	for i in range(0, Global.OFFICE_ROOM_UP_COUNTER):
		office_up_loader.add_resource(str(i), load(Global.OFFICE_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.OFFICE_ROOM_DOWN_COUNTER):
		office_down_loader.add_resource(str(i), load(Global.OFFICE_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.OFFICE_ROOM_RIGHT_COUNTER):
		office_right_loader.add_resource(str(i), load(Global.OFFICE_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.OFFICE_ROOM_LEFT_COUNTER):
		office_left_loader.add_resource(str(i), load(Global.OFFICE_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# LIBRARY ROOM LOADERS
	for i in range(0, Global.LIBRARY_ROOM_UP_COUNTER):
		library_up_loader.add_resource(str(i), load(Global.LIBRARY_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.LIBRARY_ROOM_DOWN_COUNTER):
		library_down_loader.add_resource(str(i), load(Global.LIBRARY_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.LIBRARY_ROOM_RIGHT_COUNTER):
		library_right_loader.add_resource(str(i), load(Global.LIBRARY_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.LIBRARY_ROOM_LEFT_COUNTER):
		library_left_loader.add_resource(str(i), load(Global.LIBRARY_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


	# STORAGE ROOM LOADERS
	for i in range(0, Global.STORAGE_ROOM_UP_COUNTER):
		storage_up_loader.add_resource(str(i), load(Global.STORAGE_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	
	for i in range(0, Global.STORAGE_ROOM_DOWN_COUNTER):
		storage_down_loader.add_resource(str(i), load(Global.STORAGE_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	
	for i in range(0, Global.STORAGE_ROOM_RIGHT_COUNTER):
		storage_right_loader.add_resource(str(i), load(Global.STORAGE_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	
	for i in range(0, Global.STORAGE_ROOM_LEFT_COUNTER):
		storage_left_loader.add_resource(str(i), load(Global.STORAGE_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))


func get_random_room(type: int, direction: int) -> Room:
	# Determine the appropriate resource loader based on the room type and direction
	var loader: ResourcePreloader
	match type:
		Global.ROOM_TYPE_HALLWAY:
			match direction:
				Global.DIRECTION_UP:
					loader = hallway_up_loader
				Global.DIRECTION_DOWN:
					loader = hallway_down_loader
				Global.DIRECTION_LEFT:
					loader = hallway_left_loader
				Global.DIRECTION_RIGHT:
					loader = hallway_right_loader
					
		Global.ROOM_TYPE_INNER_HALLWAY:
			match direction:
				Global.DIRECTION_UP:
					loader = inner_hallway_up_loader
				Global.DIRECTION_DOWN:
					loader = inner_hallway_down_loader
				Global.DIRECTION_LEFT:
					loader = inner_hallway_left_loader
				Global.DIRECTION_RIGHT:
					loader = inner_hallway_right_loader
		
		Global.ROOM_TYPE_BATHROOM:
			match direction:
				Global.DIRECTION_UP:
					loader = bathroom_up_loader
				Global.DIRECTION_DOWN:
					loader = bathroom_down_loader
				Global.DIRECTION_LEFT:
					loader = bathroom_left_loader
				Global.DIRECTION_RIGHT:
					loader = bathroom_right_loader
		
		Global.ROOM_TYPE_CLASSROOM:
			var random_sub_room_type = randi() % 2
			
			match direction:
				Global.DIRECTION_UP:
					match random_sub_room_type:
						0:
							loader = lab_up_loader
						1:
							loader = standard_classroom_up_loader
				Global.DIRECTION_DOWN:
					match random_sub_room_type:
						0:
							loader = lab_down_loader
						1:
							loader = standard_classroom_down_loader
				Global.DIRECTION_LEFT:
					match random_sub_room_type:
						0:
							loader = lab_left_loader
						1:
							loader = standard_classroom_left_loader
				Global.DIRECTION_RIGHT:
					match random_sub_room_type:
						0:
							loader = lab_right_loader
						1:
							loader = standard_classroom_right_loader
		
		Global.ROOM_TYPE_OFFICE:
			match direction:
				Global.DIRECTION_UP:
					loader = office_up_loader
				Global.DIRECTION_DOWN:
					loader = office_down_loader
				Global.DIRECTION_LEFT:
					loader = office_left_loader
				Global.DIRECTION_RIGHT:
					loader = office_right_loader
		
		Global.ROOM_TYPE_LIBRARY:
			match direction:
				Global.DIRECTION_UP:
					loader = library_up_loader
				Global.DIRECTION_DOWN:
					loader = library_down_loader
				Global.DIRECTION_LEFT:
					loader = library_left_loader
				Global.DIRECTION_RIGHT:
					loader = library_right_loader

		Global.ROOM_TYPE_STORAGE:
			match direction:
				Global.DIRECTION_UP:
					loader = storage_up_loader
				Global.DIRECTION_DOWN:
					loader = storage_down_loader
				Global.DIRECTION_LEFT:
					loader = storage_left_loader
				Global.DIRECTION_RIGHT:
					loader = storage_right_loader
		_:
			pass

	# Get a random resource from the appropriate loader
	var resource_list = loader.get_resource_list()
	if not resource_list.is_empty():
		var random_index = randi() % resource_list.size()
		var random_resource = loader.get_resource(resource_list[random_index])
		return random_resource.instantiate()
	else:
		return null
