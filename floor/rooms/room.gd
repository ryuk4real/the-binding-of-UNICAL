class_name Room
extends Node2D

@onready var doors: Array[Door]
@onready var walls: TileMapLayer = $Walls
@export var id: int = 0
@export var type: int = 0
var configuration: int
var is_clear: bool = true
var coordinates: Array[Vector2i] = []

func init(room_id: int = 0, room_type: int = 0) -> void:
	id = room_id
	type = room_type

func _ready() -> void:
	generate_coordinates_from_tilemaplayer()
	print(coordinates)

func generate_coordinates_from_tilemaplayer() -> void:
	coordinates.clear()
	var used_cells = walls.get_used_cells()
	
	if used_cells.is_empty():
		return
		
	# Group tiles by their logical coordinates (3x3 sections)
	var logical_sections = {}
	
	for cell in used_cells:
		var logical_x = cell.x / 3
		var logical_y = cell.y / 3
		var logical_coord = Vector2i(logical_x, logical_y)
		
		if not logical_sections.has(logical_coord):
			logical_sections[logical_coord] = 0
		logical_sections[logical_coord] += 1
	
	# Add only coordinates where tiles exist
	for logical_coord in logical_sections:
		coordinates.append(logical_coord)
