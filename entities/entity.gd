class_name Entity
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collider: CollisionShape2D = $Collider
@onready var interaction_area: Area2D = $InteractionArea

var collision: KinematicCollision2D
var enabled: bool = true
var is_floor_transitioning: bool = false

func _ready() -> void:
	SignalBus.floor_transition_started.connect(_on_floor_transition_started)
	SignalBus.floor_transition_completed.connect(_on_floor_transition_completed)

func disable() -> void:
	enabled = false
	process_mode = Node.PROCESS_MODE_DISABLED
	
	# Disable all collision shapes
	_set_collision_states(true)
	
	# Disable all area monitoring
	_set_area_states(false)
	
	hide()

func enable() -> void:
	if is_floor_transitioning:
		return
		
	enabled = true
	process_mode = Node.PROCESS_MODE_INHERIT
	
	# Re-enable all collision shapes
	_set_collision_states(false)
	
	# Re-enable all area monitoring
	_set_area_states(true)
	
	show()

func _set_collision_states(disabled: bool) -> void:
	for child in get_children():
		if child is CollisionShape2D:
			child.set_deferred("disabled", disabled)
		elif child is CollisionPolygon2D:
			child.set_deferred("disabled", disabled)

func _set_area_states(enabled: bool) -> void:
	for child in get_children():
		if child is Area2D:
			child.set_deferred("monitoring", enabled)
			child.set_deferred("monitorable", enabled)

func _on_floor_transition_started() -> void:
	is_floor_transitioning = true
	disable()

func _on_floor_transition_completed() -> void:
	is_floor_transitioning = false
	enable()
