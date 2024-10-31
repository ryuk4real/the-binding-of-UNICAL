class_name Room
extends Node2D

@onready var doors: Array[Door]
@export var id: int
@export var type: int
var configuration: int

var is_clear: bool = true

func _init(room_id: int, room_type: int) -> void:
	pass

func _ready() -> void:
	pass
