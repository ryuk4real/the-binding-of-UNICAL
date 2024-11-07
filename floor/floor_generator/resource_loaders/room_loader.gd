extends Node2D

var hallway_up_loader: ResourcePreloader
var hallway_down_loader: ResourcePreloader
var hallway_right_loader: ResourcePreloader
var hallway_left_loader: ResourcePreloader

var inner_hallway_down_loader: ResourcePreloader
var inner_hallway_up_loader: ResourcePreloader
var inner_hallway_left_loader: ResourcePreloader
var inner_hallway_right_loader: ResourcePreloader


func _ready() -> void:
	hallway_up_loader = ResourcePreloader.new()
	hallway_down_loader = ResourcePreloader.new()
	hallway_left_loader = ResourcePreloader.new()
	hallway_right_loader = ResourcePreloader.new()
	
	inner_hallway_up_loader = ResourcePreloader.new()
	inner_hallway_down_loader = ResourcePreloader.new()
	inner_hallway_left_loader = ResourcePreloader.new()
	inner_hallway_right_loader = ResourcePreloader.new()
	
	
func load_resources() -> void:
	for i in range(0, Global.HALLWAY_ROOM_UP_COUNTER):
		hallway_up_loader.add_resource(str(i), load(Global.HALLWAY_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	print(hallway_up_loader.name + " " + str(hallway_up_loader.get_resource_list().size()))

	for i in range(0, Global.HALLWAY_ROOM_DOWN_COUNTER):
		hallway_down_loader.add_resource(str(i), load(Global.HALLWAY_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	print(hallway_down_loader.name + " " + str(hallway_down_loader.get_resource_list().size()))


	for i in range(0, Global.HALLWAY_ROOM_LEFT_COUNTER):
		hallway_left_loader.add_resource(str(i), load(Global.HALLWAY_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))
	print(hallway_left_loader.name + " " + str(hallway_left_loader.get_resource_list().size()))
	
	for i in range(0, Global.HALLWAY_ROOM_RIGHT_COUNTER):
		hallway_right_loader.add_resource(str(i), load(Global.HALLWAY_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	print(hallway_right_loader.name + " " + str(hallway_right_loader.get_resource_list().size()))
	
	for i in range(0, Global.INNER_HALLWAY_ROOM_UP_COUNTER):
		inner_hallway_up_loader.add_resource(str(i), load(Global.INNER_HALLWAY_UP_FOLDER_PATH + str(i) + "_up.tscn"))
	print(inner_hallway_up_loader.name + " " + str(inner_hallway_up_loader.get_resource_list().size()))
	
	for i in range(0, Global.INNER_HALLWAY_ROOM_DOWN_COUNTER):
		inner_hallway_down_loader.add_resource(str(i), load(Global.INNER_HALLWAY_DOWN_FOLDER_PATH + str(i) + "_down.tscn"))
	print(inner_hallway_down_loader.name + " " + str(inner_hallway_down_loader.get_resource_list().size()))

	for i in range(0, Global.INNER_HALLWAY_ROOM_RIGHT_COUNTER):
		inner_hallway_right_loader.add_resource(str(i), load(Global.INNER_HALLWAY_RIGHT_FOLDER_PATH + str(i) + "_right.tscn"))
	print(inner_hallway_right_loader.name + " " + str(inner_hallway_right_loader.get_resource_list().size()))
	
	for i in range(0, Global.INNER_HALLWAY_ROOM_LEFT_COUNTER):
		inner_hallway_left_loader.add_resource(str(i), load(Global.INNER_HALLWAY_LEFT_FOLDER_PATH + str(i) + "_left.tscn"))
	print(inner_hallway_left_loader.name + " " + str(inner_hallway_left_loader.get_resource_list().size()))

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
