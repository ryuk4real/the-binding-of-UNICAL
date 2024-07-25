extends Node2D

@onready var game_scene = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator: FloorGenerator = $FloorGenerator

@onready var hallways_preloader = $Resources/HallwaysPreloader
@onready var inner_hallways_preloader = $Resources/InnerHallwaysPreloader
@onready var classrooms_preloader = $Resources/ClassroomsPreloader
@onready var offices_preloader = $Resources/OfficesPreloader
@onready var bathrooms_preloader = $Resources/BathroomsPreloader

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ui.show_loading_screen()
	_load_data()
	await SignalBus.server_started
	ui.show_main_menu()
	
func _process(delta) -> void:
	pass
	
func _save_data() -> void:
	pass

func _load_data() -> void:
	
	for i: int in range(0, Global.TOTAL_HALLWAYS - 1):
		hallways_preloader.add_resource(str(i), load(Global.HALLWAYS_PATH + "hallway_" + str(i) + ".tscn"))

	for i: int in range(0, Global.TOTAL_INNER_HALLWAYS - 1):
		inner_hallways_preloader.add_resource(str(i), load(Global.INNER_HALLWAYS_PATH + "inner_hallway_" + str(i) + ".tscn"))
	
	for i: int in range(0, Global.TOTAL_LECTURE_HALLS - 1):
		classrooms_preloader.add_resource(str(i), load(Global.LECTURE_HALLS_PATH + "classroom_" + str(i) + ".tscn"))
	
	for i: int in range(Global.TOTAL_LECTURE_HALLS, Global.TOTAL_CLASSROOMS):
		classrooms_preloader.add_resource(str(i), load(Global.STANDARD_CLASSROOMS_PATH + "classroom_"+ str(i) +".tscn"))
	
	for i: int in range(Global.TOTAL_CLASSROOMS, Global.TOTAL_CLASSROOMS + Global.TOTAL_LABS):
		classrooms_preloader.add_resource(str(i), load(Global.LABS_PATH + "classroom_" + str(i) + ".tscn"))

	for i: int in range(0, Global.TOTAL_OFFICES - 1):
		offices_preloader.add_resource(str(i), load(Global.OFFICES_PATH + "office_" + str(i) + ".tscn"))
	
	for i: int in range(0, Global.TOTAL_BATHROOMS - 1):
		bathrooms_preloader.add_resource(str(i), load(Global.BATHROOMS_PATH + "bathroom_" + str(i) + ".tscn"))

	
	emit_signal("loaded_data")

func _save_game() -> void:
	pass
	
func load_game() -> void:
	pass

func _on_new_game_pressed() -> void:
	ui.show_loading_screen()
	floor_generator.generate_floor()
	
	# TODO: setup start
	ui.show_gui()

func _quit() -> void:
	_save_data()
	get_tree().quit()

func _on_quit_pressed() -> void:
	floor_generator.worker.shutdown_server()
	_quit()
