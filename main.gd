extends Node2D

@onready var game_scene: Node2D = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator: FloorGenerator = $FloorGenerator

func _ready() -> void:
	#_set_seed()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ui.show_loading_screen()
	await SignalBus.server_started
	
	ui.show_main_menu()
	
func _process(_delta: float) -> void:
	pass
	
func _save_data() -> void:
	pass

func _save_game() -> void:
	pass
	
func load_game() -> void:
	pass

func _on_new_game_pressed() -> void:
	ui.show_loading_screen()
		
	# TODO: setup start
	floor_generator.generate_floor()
	
	ui.show_gui()	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("RESTART"):
		floor_generator.generate_floor()

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_WM_CLOSE_REQUEST:
			print("Game closed")
			_quit()

func _on_quit_pressed() -> void:
	_quit()

func _set_seed():
	seed(Time.get_datetime_string_from_system().hash())
	print(seed)

func _quit() -> void:
	floor_generator.worker.shutdown_server()
	_save_data()
	get_tree().quit()
