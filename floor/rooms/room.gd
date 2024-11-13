class_name Room
extends Node2D

@onready var doors: Array[Door]
@onready var walls: TileMapLayer = $Walls
@onready var doors_node: Node2D = $Doors
@onready var cleaned_room_pickup_spawner = $Pickups/CleanedRoomPickupSpawner
@export var id: int = 0
@export var type: int = 0
var configuration: int
var is_clear: bool = false
var coordinates: Array[Vector2i] = []
var door_tile_positions: Dictionary = {}
var door_room_positions: Dictionary = {}

var door_connections: Dictionary = {} # door1: door2
var room_connections: Dictionary = {} # door: connected_room

func init(_room_id: int = 0, _room_type: int = 0) -> void:
	id = _room_id
	type = _room_type
	generate_coordinates_from_tilemaplayer()
	initialize_doors()
	map_door_coordinates()
	
	if type == Global.ROOM_TYPE_HALLWAY:
		is_clear = true
		open_all_doors()
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
		if door:
			if door.id != 0:
				if door.is_placeholder == true or door.type == Global.ROOM_TYPE_NONE:
					door.opened_area_2d.monitoring = false
					door.hide()
				else:
					door.show()
				
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

func add_connection(_door1: Door, _door2: Door, _connected_room: Room) -> void:
	# Store door-to-door connection
	door_connections[_door1] = _door2
	
	# Store door-to-room connection
	room_connections[_door1] = _connected_room

# New helper functions for connection management
func get_connected_door(_door: Door) -> Door:
	return door_connections.get(_door)

func get_connected_room(_door: Door) -> Room:
	return room_connections.get(_door)

func get_all_connected_rooms() -> Array[Room]:
	var connected_rooms: Array[Room] = []
	for room in room_connections.values():
		if room not in connected_rooms:
			connected_rooms.append(room)
	return connected_rooms

func is_connected_to_room(_room: Room) -> bool:
	return _room in room_connections.values()

func get_connecting_door_to_room(_room: Room) -> Door:
	for door in room_connections.keys():
		if room_connections[door] == _room:
			return door
	return null

func set_room_active(active: bool) -> void:
	# Handle visibility
	visible = active
	
	# Handle collision layers
	if walls:
		# Disable/enable collision layer
		if active:
			walls.collision_enabled = true
		else:
			walls.collision_enabled = false
	
	# Handle doors collision
	for door in doors:
		if door:
			var opened_collider = door.get_node("OpenedArea2D/OpenedCollider")
			var closed_collider = door.get_node("ClosedArea2D/ClosedCollider")
			
			if opened_collider:
				opened_collider.disabled = !active
			if closed_collider:
				closed_collider.disabled = !active
				
func get_pickup_spawner_position() -> Vector2i:
	return cleaned_room_pickup_spawner.position

func close_all_doors():
	for door: Door in doors:
		door.close()
	is_clear = false

func open_all_doors():
	for door: Door in doors:
		door.open()
	is_clear = true
