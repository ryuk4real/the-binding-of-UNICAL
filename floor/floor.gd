class_name Floor
extends Node2D

var rooms: Array[Room] = []
var rooms_to_process: Array[Room] = []
@onready var room_scene: Node2D = $Rooms
var current_room: Room

# Matrix to store room positions. Each cell contains 0 (empty) or room id
var floor_matrix: Array = []
var matrix_size: int = Global.MAP_SIZE

const EMPTY_CELL: int = -1
const INVALID_POSITION: int = -1
const DOOR_OFFSET: int = 15


func _ready() -> void:
	SignalBus.connect("door_entered", _on_door_entered)
	_initialize_matrix()
	

func _initialize_matrix() -> void:
	# Initialize empty matrix
	floor_matrix.clear()
	for x in range(matrix_size):
		var row = []
		for y in range(matrix_size):
			row.append(EMPTY_CELL)
		floor_matrix.append(row)

func init(_starting_room: Room) -> void:
	_initialize_matrix()
	# Place starting room at matrix center
	var center = matrix_size / 2
	place_room(_starting_room, Vector2i(center, center))


func _on_door_entered(_door: Door):
	if Global.current_room.room_connections.has(_door):
		for projectile in Global.projectiles_scene.get_children():
			projectile.queue_free()
		
		Global.transitioner.set_next_animation(true)
		
		var room_to_visit: Room = Global.current_room.room_connections[_door]

		#room_to_visit.set_door_visible()
		
		# TODO: Set doors closed if room is not clear
		
		current_room = room_to_visit
		
		# Get the connected door in the new room
		var connected_door = Global.current_room.get_connected_door(_door)
		
		if connected_door:
			# Calculate the spawn position based on door direction
			var spawn_offset = Vector2i.ZERO
			match connected_door.direction:
				Global.DIRECTION_UP:    # Player should appear below the door
					spawn_offset = Vector2(0, DOOR_OFFSET)
				Global.DIRECTION_DOWN:  # Player should appear above the door
					spawn_offset = Vector2(0, -DOOR_OFFSET)
				Global.DIRECTION_LEFT:  # Player should appear to the right of the door
					spawn_offset = Vector2(DOOR_OFFSET, 0)
				Global.DIRECTION_RIGHT: # Player should appear to the left of the door
					spawn_offset = Vector2(-DOOR_OFFSET, 0)
			
			await Global.transitioner.animation_player.animation_finished
			# Set player position relative to the connected door
			Global.transitioner.set_next_animation(false)
			
			Global.player.position = connected_door.global_position as Vector2 + spawn_offset
			call_deferred("set_active_room", current_room.id)
			await Global.transitioner.animation_player.animation_finished

func place_room(room: Room, target_pos: Vector2i) -> bool:
	#print("\nPlacing room %d at target position %s" % [room.id, target_pos])
	print("Room coordinates: %s" % [room.coordinates])
	
	# Find the connecting door local position to use as offset
	var door_local_pos = Vector2i.ZERO
	for door: Door in room.doors:
		if door != null and door.id == 0:  # This finds the entry door
			door_local_pos = room.get_door_local_position(door)
			break
	
	print("Door local position: %s" % door_local_pos)
	
	# Calculate offset from door position to room coordinates
	for coord in room.coordinates:
		# Adjust the position by the difference between room coordinate and door position
		var adjusted_x = target_pos.x + (coord.x - door_local_pos.x)
		var adjusted_y = target_pos.y + (coord.y - door_local_pos.y)
		print("Placing room %d at position %s" % [room.id, Vector2i(adjusted_x, adjusted_y)])
		
		floor_matrix[adjusted_x][adjusted_y] = room.id
		
		# Update door positions in the matrix
		for door: Door in room.doors:
			if door != null:
				var door_local_position = room.get_door_local_position(door)
				if coord == door_local_position:
					#print("Setting door position for door %d to %s" % [door.id, Vector2i(adjusted_x, adjusted_y)])
					door.map_position = Vector2i(adjusted_x, adjusted_y)
	
	rooms.append(room)
	return true


func is_valid_matrix_position(pos: Vector2i) -> bool:
	var is_valid = pos.x >= 0 and pos.x < matrix_size and pos.y >= 0 and pos.y < matrix_size
	#if not is_valid:
	#	print("Invalid matrix position: %s (matrix size: %d)" % [pos, matrix_size])
	return is_valid

func can_place_room(room: Room, target_pos: Vector2i) -> bool:
	#print(">> Checking if can place room %d at target position %s" % [room.id, target_pos])
	
	# Ensure room has coordinates
	if room.coordinates.is_empty():
		#print("Room coordinates not initialized!")
		return false
		
	#print("Room coordinates: %s" % [room.coordinates])
	
	# Find the connecting door local position to use as offset
	var door_local_pos = Vector2i.ZERO
	var entry_door_found = false
	for door: Door in room.doors:
		if door != null:
			if not door.is_placeholder:  # This finds the entry door
				door_local_pos = room.get_door_local_position(door)
				entry_door_found = true
				break
	
	if not entry_door_found:
		#print("No valid entry door found!")
		return false
		
	#print("Door local position: %s" % door_local_pos)
	
	# Store all positions we'll need to check
	var positions_to_check: Array[Vector2i] = []
	
	# Calculate all positions that need to be checked
	for coord in room.coordinates:
		var adjusted_x = target_pos.x + (coord.x - door_local_pos.x)
		var adjusted_y = target_pos.y + (coord.y - door_local_pos.y)
		var adjusted_pos = Vector2i(adjusted_x, adjusted_y)
		positions_to_check.append(adjusted_pos)
	
	#print("All positions to check: %s" % [positions_to_check])
	
	# Now check each position
	for check_pos in positions_to_check:
		#print("-> Checking position: " + str(check_pos))
		
		# Check if position is within matrix bounds
		if not is_valid_matrix_position(check_pos):
			#print("Position out of bounds")
			return false
		
		# Check if position is already occupied
		var cell_value = get_matrix_value(check_pos)
		#print("-> Current cell value: %d" % cell_value)
		
		if cell_value != EMPTY_CELL:
			#print("Position already occupied by room " + str(cell_value))
			return false
	
	#print("Room can be placed - all positions are available")
	return true

func get_matrix_value(pos: Vector2i) -> int:
	if is_valid_matrix_position(pos):
		return floor_matrix[pos.x][pos.y]
	return INVALID_POSITION

func print_room_connections() -> void:
	# print("\nRoom Connections:")
	# print("================")
	
	for room in rooms:
		#print("\nRoom %d (Type: %s):" % [room.id, _get_room_type_name(room.type)])
		var has_connections = false
		
		for door in room.doors:
			if door != null:
				var connected_room = room.get_connected_room(door)
				var connected_door = room.get_connected_door(door)
				
				if connected_room != null and connected_door != null:
					has_connections = true
					#print("  Door %d (%s) -> Room %d Door %d (%s)" % [
					#	door.id, 
					#	_get_direction_name(door.direction),
					#	connected_room.id,
					#	connected_door.id,
					#	_get_direction_name(connected_door.direction)
					#])
				elif not door.is_placeholder:
					has_connections = true
					#print("  Door %d (%s) -> Unconnected" % [
					#	door.id,
					#	_get_direction_name(door.direction)
					#])
			
		#if not has_connections:
		#	print("  No connections")
	
	# print("\n")

func _get_direction_name(direction: int) -> String:
	match direction:
		Global.DIRECTION_UP: return "UP"
		Global.DIRECTION_DOWN: return "DOWN"
		Global.DIRECTION_LEFT: return "LEFT"
		Global.DIRECTION_RIGHT: return "RIGHT"
		_: return "UNKNOWN"

func _get_room_type_name(type: int) -> String:
	match type:
		Global.ROOM_TYPE_HALLWAY: return "HALLWAY"
		Global.ROOM_TYPE_INNER_HALLWAY: return "INNER_HALLWAY"
		Global.ROOM_TYPE_BATHROOM: return "BATHROOM"
		Global.ROOM_TYPE_CLASSROOM: return "CLASSROOM"
		Global.ROOM_TYPE_OFFICE: return "OFFICE"
		Global.ROOM_TYPE_STORAGE: return "STORAGE"
		Global.ROOM_TYPE_LIBRARY: return "LIBRARY"
		Global.ROOM_TYPE_NONE: return "NONE"
		_: return "UNKNOWN"

func print_floor() -> void:
	print("\nFloor Matrix:")
	for x in range(matrix_size):
		var row = ""
		for y in range(matrix_size):
			
			# Format each number to take up exactly 3 spaces, right-aligned
			var value = floor_matrix[x][y]
			
			row += "%3d " % value  # %3d means right-align number in 3 spaces
		print(row)

func find_room(_id: int):
	for room: Room in rooms:
		if room.id == 0:
			return room
	return null

func set_active_room(room_id: int) -> void:
	for room in rooms:
		if room.id == room_id:
			room.set_room_active(true)
			room.set_door_visible()
			current_room = room
			Global.current_room = current_room
			#print("Changed current room to %s" % Global.current_room)
		else:
			room.set_room_active(false)

func set_just_first_room_visible() -> void:
	var first_room = find_room(0)
	if first_room:
		set_active_room(0)
