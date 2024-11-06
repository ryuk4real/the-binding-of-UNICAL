extends Node2D

@onready var game_scene: Node2D = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator = $FloorGenerator
@onready var room_loader = $Resources/RoomLoader
var current_floor: Floor

func _ready() -> void:
	_set_seed()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	ui.show_loading_screen()
	_load_resources_from_loaders()
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
	
func _load_resources_from_loaders() -> void:
	room_loader.load_resources()
	pass

func _on_new_game_pressed() -> void:
	ui.show_loading_screen()
	
	current_floor = await floor_generator.generate_floor()
	
	ui.show_gui()

# Helper function to find room position in matrix
func _get_room_matrix_position(room: Room) -> Vector2:
	for y in range(current_floor.matrix_size):
		for x in range(current_floor.matrix_size):
			if current_floor.floor_matrix[y][x] == room.id:
				return Vector2(x, y)
	return Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("RESTART"):
		floor_generator.generate_floor()

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_WM_CLOSE_REQUEST:
			_quit()

func _on_quit_pressed() -> void:
	_quit()

func _set_seed() -> void:
	var new_seed: int = Time.get_datetime_string_from_system().hash()
	seed(new_seed)
	print("seed:" + str(new_seed))

func _quit() -> void:
	floor_generator.worker.shutdown_server()
	_save_data()
	print("Game closed")
	get_tree().quit()
