class_name Door
extends Node2D

@onready var opened_collider = $OpenedArea2D/OpenedCollider
@onready var closed_collider = $ClosedArea2D/ClosedCollider

@export var id: int
@export var type: int
@export var opened: bool = false

var direction: int

func _ready() -> void:
	set_door_direction(transform.get_rotation())

func open() -> void:
	$Sprite2D.frame = 0
	closed_collider.disabled = true
	opened_collider.disabled = false
	opened = true
	
func close() -> void:
	$Sprite2D.frame = 1
	closed_collider.disabled = false
	opened_collider.disabled = true
	opened = false

func set_door_direction(door_rotation: float) -> void:
	match door_rotation:
		0: direction = Global.DIRECTION_UP
		90: direction = Global.DIRECTION_RIGHT
		-90: direction = Global.DIRECTION_LEFT
		180: direction = Global.DIRECTION_DOWN

func _on_opened_area_2d_area_entered(_area: Area2D):
	SignalBus.door_entered.emit(self)
