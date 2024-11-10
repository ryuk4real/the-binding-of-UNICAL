class_name Floor
extends Node2D

var rooms: Array[Room] = []
var rooms_to_process: Array[Room] = []
var current_room: Room
@onready var room_scene: Node2D = $Rooms

# Matrix to store room positions. Each cell contains 0 (empty) or room id
var floor_matrix: Array = []
var matrix_size: int

const EMPTY_CELL = -1
const INVALID_POSITION = -1

func _ready() -> void:
	matrix_size = Global.MAP_SIZE
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
	
func place_room(room: Room, target_pos: Vector2i) -> bool:
	#print("\nPlacing room %d at target position %s" % [room.id, target_pos])
	#print("Room coordinates: %s" % [room.coordinates])
	
	# Find the connecting door local position to use as offset
	var door_local_pos = Vector2i.ZERO
	for door: Door in room.doors:
		if door.direction == -door.direction:  # This finds the entry door
			door_local_pos = room.get_door_local_position(door)
			break
	
	#print("Door local position: %s" % door_local_pos)
	
	# Calculate offset from door position to room coordinates
	for coord in room.coordinates:
		# Adjust the position by the difference between room coordinate and door position
		var adjusted_x = target_pos.x + (coord.x - door_local_pos.x)
		var adjusted_y = target_pos.y + (coord.y - door_local_pos.y)
		#print("Placing room %d at position %s" % [room.id, Vector2i(adjusted_x, adjusted_y)])
		
		floor_matrix[adjusted_x][adjusted_y] = room.id
		
		# Update door positions in the matrix
		for door: Door in room.doors:
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

func print_floor() -> void:
	print("\nFloor Matrix:")
	for x in range(matrix_size):
		var row = ""
		for y in range(matrix_size):
			# Format each number to take up exactly 3 spaces, right-aligned
			var value = floor_matrix[x][y]
			row += "%3d " % value  # %3d means right-align number in 3 spaces
		print(row)
