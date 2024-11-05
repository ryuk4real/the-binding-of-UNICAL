class_name Room
extends Node2D

@onready var doors: Array[Door]
@onready var walls: TileMapLayer = $Walls
@onready var doors_node: Node2D = $Doors
@export var id: int = 0
@export var type: int = 0
var configuration: int
var is_clear: bool = true
var coordinates: Array[Vector2i] = []
var door_tile_positions: Dictionary = {}
var door_room_positions: Dictionary = {}

func init(_room_id: int = 0, _room_type: int = 0) -> void:
	id = _room_id
	type = _room_type

func _ready() -> void:
	generate_coordinates_from_tilemaplayer()
	initialize_doors()
	generate_coordinates_from_tilemaplayer()
	map_door_coordinates()
	#print(str(get_door_room_position(doors[5])) + " " + str(doors[5].type) + " " + str(doors[5].direction))

func initialize_doors() -> void:
	for child in doors_node.get_children():
		if child is Node2D and child.name.begins_with("Door"):
			doors.append(child as Door)


func generate_coordinates_from_tilemaplayer() -> void:
	# Uses the tilemap to retrive the logical coordinates of the room.
	# For example a rectangular 9x3 tile room it is broken down in an array of
	# 	coordinates like [(0,0),(0,1),(0,2)]
	
	coordinates.clear()
	var used_cells: Array[Vector2i] = walls.get_used_cells()
	
	if used_cells.is_empty():
		return
		
	# Grouping tiles by their logical coordinates (3x3 sections)
	var logical_sections: Dictionary = {}
	
	for cell in used_cells:
		var logical_x: int = cell.x / 3
		var logical_y: int = cell.y / 3
		var logical_coord: Vector2i = Vector2i(logical_x, logical_y)
		
		if not logical_sections.has(logical_coord):
			logical_sections[logical_coord] = 0
		logical_sections[logical_coord] += 1
	
	for logical_coord: Vector2i in logical_sections:
		coordinates.append(logical_coord)

func map_door_coordinates() -> void:
	# Maps each door's position in relation to the tilemap and the room's logical grid system.
	# Each room appears to be made up of 3x3 tile sections (logical coordinates)
	# For each door in the room, the method:
	# 
	#  - Gets the door's global position
	#  - Converts it to tilemap coordinates
	#  - Calculates two important positions:
	# 
	# The logical room section the door is in, stored in door_room_positions
	# The specific tile position within that 3x3 section, stored in door_tile_positions
	for door in doors:
		var door_position = door.global_position
		var tile_coords = walls.local_to_map(door_position)
		var logical_x = tile_coords.x / 3
		var logical_y = tile_coords.y / 3
		var logical_coord = Vector2i(logical_x, logical_y)
		
		var tile_x_offset = tile_coords.x % 3
		var tile_y_offset = tile_coords.y % 3
		
		door_tile_positions[door] = Vector2i(tile_x_offset, tile_y_offset)
		door_room_positions[door] = logical_coord

func get_door_tile_position(door: Door) -> Vector2i:
	return door_tile_positions.get(door, Vector2i.ZERO)

func get_door_room_position(door: Door) -> Vector2i:
	return door_room_positions.get(door, Vector2i.ZERO)
