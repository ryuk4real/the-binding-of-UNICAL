extends Node2D

@onready var game_scene: Node2D = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator = $FloorGenerator
@onready var room_loader = $Resources/RoomLoader
@onready var entity_loader = $Resources/EntityLoader

var player: Player = null
var current_floor: Floor = null

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
	entity_loader.load_resources()

func _on_new_game_pressed() -> void:
	ui.show_loading_screen()
	
	current_floor = await get_floor()
	current_floor.set_active_room(0)
	current_floor.show()
	
	setup_player()
	set_player_on_scene()
	ui.show_gui()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("RESTART"):
		if ui.main_menu.visible == false and ui.loading_screen.visible == false:
			player.hide()
			ui.show_loading_screen()
			current_floor = await get_floor()
			current_floor.set_active_room(0)
			current_floor.show()
			setup_player()
			set_player_on_scene()
			player.show()
			ui.show_gui()
	
	if event.is_action_pressed("OPEN_CLOSE_DOORS"):
		if current_floor.current_room.is_clear:
			current_floor.current_room.close_all_doors()
		else:
			current_floor.current_room.open_all_doors()

func setup_player() -> void:
	player = entity_loader.get_player()

func get_floor() -> Floor:
	floor_generator.reset()
	
	if current_floor != null:
		current_floor.free()
	
	var new_floor: Floor
	while new_floor == null:
		new_floor = await floor_generator.generate_floor()
	
	return new_floor

func set_player_on_scene() -> void:
	game_scene.add_child(player)
	player.position = current_floor.current_room.get_pickup_spawner_position()

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
