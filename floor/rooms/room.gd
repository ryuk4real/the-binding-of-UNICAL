class_name Room
extends Node2D

@onready var doors: Array[Door]
@export var id: int = 0
@export var type: int = 0
var configuration: int
var is_clear: bool = true

func init(room_id: int = 0, room_type: int = 0) -> void:
	pass
	
func _ready() -> void:
	Global.current_room_type = type
