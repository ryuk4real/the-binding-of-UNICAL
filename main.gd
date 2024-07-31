extends Node2D

@onready var game_scene = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator: FloorGenerator = $FloorGenerator

@onready var hallways_preloader: ResourcePreloader = $Resources/HallwaysPreloader
@onready var inner_hallways_preloader: ResourcePreloader = $Resources/InnerHallwaysPreloader
@onready var classrooms_preloader: ResourcePreloader = $Resources/ClassroomsPreloader
@onready var offices_preloader: ResourcePreloader = $Resources/OfficesPreloader
@onready var bathrooms_preloader: ResourcePreloader = $Resources/BathroomsPreloader

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ui.show_loading_screen()
	_load_data()
	await SignalBus.server_started
	ui.show_main_menu()
	
func _process(_delta) -> void:
	pass
	
func _save_data() -> void:
	pass

func _load_data() -> void:
	
	for i: int in range(0, Global.TOTAL_HALLWAYS):
		hallways_preloader.add_resource(str(i), load(Global.HALLWAYS_PATH + "hallway_" + str(i) + ".tscn"))

	for i: int in range(0, Global.TOTAL_INNER_HALLWAYS - 1):
		inner_hallways_preloader.add_resource(str(i), load(Global.INNER_HALLWAYS_PATH + "inner_hallway_" + str(i) + ".tscn"))
	
	for i: int in range(0, Global.TOTAL_LECTURE_HALLS):
		classrooms_preloader.add_resource(str(i), load(Global.LECTURE_HALLS_PATH + "classroom_" + str(i) + ".tscn"))
	
	for i: int in range(Global.TOTAL_LECTURE_HALLS, Global.TOTAL_LECTURE_HALLS + Global.TOTAL_STANDARD_CLASSROOMS):
		classrooms_preloader.add_resource(str(i), load(Global.STANDARD_CLASSROOMS_PATH + "classroom_"+ str(i) +".tscn"))
	
	for i: int in range(Global.TOTAL_LECTURE_HALLS + Global.TOTAL_STANDARD_CLASSROOMS, Global.TOTAL_CLASSROOMS):
		classrooms_preloader.add_resource(str(i), load(Global.LABS_PATH + "classroom_" + str(i) + ".tscn"))

	for i: int in range(0, Global.TOTAL_OFFICES):
		offices_preloader.add_resource(str(i), load(Global.OFFICES_PATH + "office_" + str(i) + ".tscn"))
	
	for i: int in range(0, Global.TOTAL_BATHROOMS):
		bathrooms_preloader.add_resource(str(i), load(Global.BATHROOMS_PATH + "bathroom_" + str(i) + ".tscn"))
	
	for preloader: ResourcePreloader in $Resources.get_children():
		print(preloader.name + " " + str(preloader.get_resource_list().size()))

func _save_game() -> void:
	pass
	
func load_game() -> void:
	pass

func _on_new_game_pressed() -> void:
	ui.show_loading_screen()
	
	var current_floor: Floor = null
	
	while current_floor == null:
		current_floor = await floor_generator.generate_floor()
	
	#current_floor.instantiate()
	game_scene.add_child(current_floor, true, INTERNAL_MODE_FRONT)
	
	# TODO: setup start
	ui.show_gui()

func _quit() -> void:
	_save_data()
	get_tree().quit()

func _on_quit_pressed() -> void:
	floor_generator.worker.shutdown_server()
	_quit()
