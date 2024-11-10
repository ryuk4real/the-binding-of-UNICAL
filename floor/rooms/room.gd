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
	generate_coordinates_from_tilemaplayer()
	initialize_doors()
	map_door_coordinates()
	print("ROOM %s -> %s" % [id, coordinates])

func _ready() -> void:
	generate_coordinates_from_tilemaplayer()
	initialize_doors()
	map_door_coordinates()
	
	#print("door room positions: %s\n" % door_room_positions)
	#print(str(get_door_room_position(doors[5])) + " " + str(doors[5].type) + " " + str(doors[5].direction))

func initialize_doors() -> void:
	if doors.is_empty():
		for child in doors_node.get_children():
			if child is Node2D and child.name.begins_with("Door"):
				doors.append(child as Door)

func set_door_visible() -> void:
	for door: Door in doors:
		if (door.type != Global.ROOM_TYPE_HALLWAY and door.type != Global.ROOM_TYPE_NONE):
			door.visible = true


func generate_coordinates_from_tilemaplayer() -> void:
	coordinates.clear()
	var used_cells: Array[Vector2i] = walls.get_used_cells()
	
	if used_cells.is_empty():
		return
		
	# Find the main door (non-placeholder) position
	var main_door_pos = Vector2i.ZERO
	for door in doors:
		if not door.is_placeholder:
			var door_pos = walls.local_to_map(door.global_position)
			main_door_pos = Vector2i(door_pos.x / 3, door_pos.y / 3)
			break
	
	# Grouping tiles by their logical coordinates (3x3 sections)
	var logical_sections: Dictionary = {}
	
	for cell in used_cells:
		var logical_x: int = cell.x / 3
		var logical_y: int = cell.y / 3
		# Offset coordinates relative to main door position
		var relative_x = logical_y - main_door_pos.y  # Note: Swapped x and y here
		var relative_y = logical_x - main_door_pos.x
		var logical_coord = Vector2i(relative_x, relative_y)
		
		if not logical_sections.has(logical_coord):
			logical_sections[logical_coord] = 0
		logical_sections[logical_coord] += 1
	
	for logical_coord in logical_sections:
		coordinates.append(logical_coord)
	print("Room coordinates relative to main door: ", coordinates)

func map_door_coordinates() -> void:
	# Find the main door position first
	var main_door_pos = Vector2i.ZERO
	var main_door: Door = null
	for door in doors:
		if not door.is_placeholder:
			var door_tile_coords = walls.local_to_map(door.global_position)
			main_door_pos = Vector2i(door_tile_coords.x / 3, door_tile_coords.y / 3)
			main_door = door
			break
	
	# Now map all doors relative to the main door position
	for door in doors:
		var door_position = door.global_position
		var tile_coords = walls.local_to_map(door_position)
		var logical_x = tile_coords.x / 3
		var logical_y = tile_coords.y / 3
		
		# Calculate position relative to main door
		var relative_x = logical_y - main_door_pos.y  # Note: Swapped x and y here
		var relative_y = logical_x - main_door_pos.x
		var logical_coord = Vector2i(relative_x, relative_y)
		
		var tile_x_offset = tile_coords.x % 3
		var tile_y_offset = tile_coords.y % 3
		
		door_tile_positions[door] = Vector2i(tile_x_offset, tile_y_offset)
		door_room_positions[door] = logical_coord
		
		#print("Door %s at relative position: %s" % [door.id, logical_coord])

func get_door_tile_position(door: Door) -> Vector2i:
	return door_tile_positions.get(door)

func get_door_local_position(door: Door) -> Vector2i:
	return door_room_positions.get(door)

func from_position_get_door(_position: Vector2i) -> Door:
	for key in door_room_positions.keys():
		if door_room_positions[key] == _position:
			print("key of door found: " +  str(_position))
			return key
	return null

func find_door(_id: int) -> Door:
	for door: Door in doors:
		if door.id == _id:
			return door
	return null

func remove_doors_by_types(_door_type: int) -> void:
	# Loop through the doors and remove the ones with the given types
	for door: Door in doors:
		if door.type ==  _door_type:
			doors.erase(door)
