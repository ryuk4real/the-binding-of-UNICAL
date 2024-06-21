extends Node2D

@onready var game_scene = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator: FloorGenerator = $FloorGenerator

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	ui.show_main_menu()
	
func _process(delta) -> void:
	pass
	
func save_data():
	pass
	
func quit():
	save_data()
	get_tree().quit()

func load_data():
	pass

func _on_floor_generator_server_shut():
	quit()

func _on_new_game_pressed():
	ui.show_loading_screen()
	load_data()
	floor_generator.generate_floor()

func _on_floor_generator_floor_generated():
	ui.show_gui()
