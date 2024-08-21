extends Node2D

@onready var game_scene = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator: FloorGenerator = $FloorGenerator

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ui.show_loading_screen()
	await SignalBus.server_started
	ui.show_main_menu()
	
func _process(_delta) -> void:
	pass
	
func _save_data() -> void:
	pass

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
