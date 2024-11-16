extends Node2D

@onready var game_scene: Node2D = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator = $FloorGenerator
@onready var room_loader = $Resources/RoomLoader
@onready var entity_loader = $Resources/EntityLoader
@onready var projectiles_scene: Node2D = $Game/Projectiles

func _ready() -> void:
	_set_seed()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	Global.game_scene = game_scene
	Global.projectiles_scene = projectiles_scene
	Global.entity_loader = entity_loader
	
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
	
	Global.current_floor = await get_floor()
	Global.current_floor.set_active_room(0)
	Global.current_floor.show()
	
	setup_player()
	set_player_on_scene()
	Global.projectiles_scene.move_to_front()
	
	ui.show_gui()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("OPEN_CLOSE_DOORS"):
		if Global.current_floor.current_room.is_clear:
			Global.current_floor.current_room.close_all_doors()
		else:
			Global.current_floor.current_room.open_all_doors()

func setup_player() -> void:
	if Global.player == null:
		Global.player = entity_loader.get_player()

func get_floor() -> Floor:
	floor_generator.reset()
	
	if Global.current_floor != null:
		Global.current_floor.free()
	
	var new_floor: Floor
	while new_floor == null:
		new_floor = await floor_generator.generate_floor()
	
	return new_floor

func set_player_on_scene() -> void:
	game_scene.add_child(Global.player)
	Global.player.position = Global.current_floor.current_room.get_pickup_spawner_position()
	Global.player.camera_2d.align()

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
