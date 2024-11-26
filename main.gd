extends Node2D

@onready var game_scene: Node2D = $Game
@onready var ui: UIManager = $UI
@onready var floor_generator = $FloorGenerator
@onready var room_loader = $Resources/RoomLoader
@onready var entity_loader = $Resources/EntityLoader
@onready var projectiles_scene: Node2D = $Game/Projectiles

var _is_changing_floor: bool = false

func _ready() -> void:
	_set_seed()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	Global.game_scene = game_scene
	Global.projectiles_scene = projectiles_scene
	Global.entity_loader = entity_loader
	Global.collectible_program = Utils.read_file(Global.COLLECTIBLE_TYPE_GUESSER_PATH)
	SignalBus.player_health_reached_zero.connect(_on_player_health_reached_zero)
	SignalBus.go_to_next_floor.connect(_on_go_to_next_floor)
	
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
	await _setup_new_floor(true)
	ui.show_gui()

func _cleanup_current_floor() -> void:
	if Global.current_floor != null:
		for child in Global.current_floor.get_children():
			child.queue_free()
		Global.current_floor.queue_free()
		await Global.current_floor.tree_exited

func _cleanup_current_projectiles() -> void:
	for projectile in Global.projectiles_scene.get_children():
		if projectile.has_method("_death_animation_start"):
			projectile._death_animation_start()
		else:
			projectile.queue_free()

func _setup_new_floor(is_new_game: bool = false) -> void:
	ui.show_loading_screen()
	
	if _is_changing_floor:
		print("Floor change already in progress")
		return
		
	_is_changing_floor = true
	
	# Emit signal to disable all entities
	SignalBus.emit_signal("floor_transition_started")
	_cleanup_current_projectiles()
	
	if Global.player:
		Global.player.hide()
		Global.player.enabled = false
		Global.player.global_position = Vector2i(1000,1000)
	
	await get_tree().physics_frame
	await get_tree().process_frame
	await _cleanup_current_floor()
	
	# Generate new floor
	var new_floor = await get_floor()
	if new_floor:
		Global.current_floor = new_floor
		call_deferred("_configure_new_floor", is_new_game)
		
		# Wait for configuration to complete
		await get_tree().process_frame
	
	_is_changing_floor = false
	
	# Emit signal to re-enable all entities after everything is set up
	SignalBus.emit_signal("floor_transition_completed")
	ui.show_gui()

func _configure_new_floor(is_new_game: bool) -> void:
	Global.current_floor.set_active_room(0)
	Global.current_floor.show()
	
	if is_new_game:
		setup_player()
	call_deferred("set_player_on_scene")
	Global.projectiles_scene.move_to_front()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("OPEN_CLOSE_DOORS"):
		if Global.current_floor.current_room.is_clear:
			Global.current_floor.current_room.close_all_doors()
		else:
			Global.current_floor.current_room.open_all_doors()

func setup_player() -> void:
	if Global.player != null:
		Global.player.queue_free()
		await Global.player.tree_exited

	Global.player = entity_loader.get_player()

func get_floor() -> Floor:
	# Wait for physics frame to complete before generating new floor
	await get_tree().physics_frame
	
	var new_floor: Floor
	while new_floor == null:
		new_floor = await floor_generator.generate_floor()
	
	return new_floor

func set_player_on_scene() -> void:
	if not is_instance_valid(Global.player) or not is_instance_valid(Global.current_floor):
		return
		
	if Global.player.get_parent() != null:
		Global.player.get_parent().remove_child(Global.player)
	
	game_scene.call_deferred("add_child", Global.player)
	await get_tree().process_frame
	
	if is_instance_valid(Global.player) and is_instance_valid(Global.current_floor):
		Global.player.position = Global.current_floor.current_room.get_pickup_spawner_position()
		Global.player.camera_2d.align()
		Global.player.enabled = true
		Global.player.show()

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

func _on_player_health_reached_zero() -> void:
	ui.show_game_over_screen()

func _on_main_menu_pressed() -> void:
	if Global.current_floor:
		Global.current_floor.queue_free()
	if Global.player:
		Global.player.queue_free()
	ui.show_main_menu()

func _on_go_to_next_floor() -> void:
	if _is_changing_floor:
		#print("Floor change already in progress, please wait")
		return
		
	#print("Going to next floor")
	await _setup_new_floor(false)
