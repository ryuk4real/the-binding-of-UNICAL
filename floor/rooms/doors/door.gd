class_name Door
extends Node2D

@onready var opened_area_2d: Area2D = $OpenedArea2D
@onready var opened_collider: CollisionShape2D = $OpenedArea2D/OpenedCollider
@onready var closed_area_2d = $ClosedArea2D
@onready var closed_collider: CollisionShape2D = $ClosedArea2D/ClosedCollider

@export var inner_hallway_inside_door_texture: Texture
@export var inner_hallway_outside_door_texture: Texture
@export var bathroom_door_texture: Texture
@export var classroom_inside_door_texture: Texture
@export var classroom_outside_door_texture: Texture
@export var office_door_texture: Texture
@export var library_door_texture: Texture
@export var storage_door_texture: Texture
@export var placeholder_door_texture: Texture

@export var id: int
@export var type: int
@export var opened: bool = false
@export var is_placeholder: bool = false

var map_position: Vector2i
var direction: int

func _ready() -> void:
	init_direction()
	setup_door_sprite(0)

func init_direction() -> void:
	set_door_direction(round(rotation * (180 / PI)))

func _enter_tree() -> void:
	$Sprite2D.texture = placeholder_door_texture

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

func set_door_direction(door_rotation: int) -> void:
	match door_rotation:
		0: direction = Global.DIRECTION_UP
		90: direction = Global.DIRECTION_RIGHT
		-90: direction = Global.DIRECTION_LEFT
		180: direction = Global.DIRECTION_DOWN

func _on_opened_area_2d_area_entered(_area: Area2D) -> void:
	if opened:
		SignalBus.door_entered.emit(self)
		#print("Player entered in door %s " % id)
		
func setup_door_sprite(_current_room_type: int) -> void:

	match type:
		Global.ROOM_TYPE_INNER_HALLWAY:
			if type == _current_room_type:
				$Sprite2D.texture = inner_hallway_inside_door_texture
			else:
				$Sprite2D.texture = inner_hallway_outside_door_texture
				
		Global.ROOM_TYPE_CLASSROOM:
			if type == _current_room_type:
				$Sprite2D.texture = classroom_inside_door_texture
			else:
				$Sprite2D.texture = classroom_outside_door_texture
				
		Global.ROOM_TYPE_OFFICE:
			$Sprite2D.texture = office_door_texture
				
		Global.ROOM_TYPE_BATHROOM:
			
			$Sprite2D.texture = bathroom_door_texture
			
		Global.ROOM_TYPE_STORAGE:
			$Sprite2D.texture = storage_door_texture
			
		Global.ROOM_TYPE_LIBRARY:
			$Sprite2D.texture = library_door_texture
