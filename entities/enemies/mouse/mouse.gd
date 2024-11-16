class_name Mouse
extends Entity

@export var movement_speed: float = 4.0
@onready var navigation_agent = $NavigationAgent2D

var cooldown = 100;

func _ready() -> void:
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	set_movement_target(Vector2(100.0 * cooldown, 100.0 * cooldown))
	
func _process(delta):
	if cooldown >= 0:
		cooldown -= delta * 20
		
	if cooldown <= 0:
		set_movement_target(Vector2(randf_range(-200,200),randf_range(-200,200)))
		cooldown = 100

func set_movement_target(movement_target: Vector2):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	# Do not query when the map has never synchronized and is empty.
	if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
		return
	if navigation_agent.is_navigation_finished():
		return

	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()
