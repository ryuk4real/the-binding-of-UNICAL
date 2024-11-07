class_name Floor
extends Node2D

var rooms: Array[Room] = []
var connections: Dictionary = {}
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
	for y in range(matrix_size):
		var row = []
		for x in range(matrix_size):
			row.append(EMPTY_CELL)
		floor_matrix.append(row)

func init(_starting_room: Room) -> void:
	_initialize_matrix()
	# Place starting room at matrix center
	var center = matrix_size / 2
	add_room(_starting_room, Vector2i(center, center))

func add_room(_room: Room, _start_pos: Vector2i) -> bool:
	
	# Add the room to the matrix
	for coord in _room.coordinates:
		var room_pos = Vector2i(_start_pos.x + coord.x, _start_pos.y + coord.y)
		floor_matrix[room_pos.y][room_pos.x] = _room.id
		print(floor_matrix[_start_pos.y][_start_pos.x])

		var door = _room.from_position_get_door(coord)
		
		if door != null:
			door.map_position = room_pos
	
	# Add the room to the list of rooms
	rooms.append(_room)

	return true

func is_valid_matrix_position(pos: Vector2i) -> bool:
	return pos.x >= 0 and pos.x < matrix_size and pos.y >= 0 and pos.y < matrix_size

func can_place_room(room: Room, target_pos: Vector2i) -> bool:
	# Calculate the bounding box of the room
	var min_x = target_pos.x
	var min_y = target_pos.y
	var max_x = target_pos.x
	var max_y = target_pos.y
	for coord in room.coordinates:
		min_x = min(min_x, target_pos.x + coord.x)
		min_y = min(min_y, target_pos.y + coord.y)
		max_x = max(max_x, target_pos.x + coord.x)
		max_y = max(max_y, target_pos.y + coord.y)

	# Check if the bounding box is within the matrix bounds
	if min_x < 0 or min_y < 0 or max_x >= matrix_size or max_y >= matrix_size:
		return false

	# Check if any of the room's coordinates are already occupied
	for coord in room.coordinates:
		var check_pos = Vector2i(target_pos.x + coord.x, target_pos.y + coord.y)
		if floor_matrix[check_pos.y][check_pos.x] != EMPTY_CELL:
			return false

	return true

func get_matrix_value(pos: Vector2i) -> int:
	if is_valid_matrix_position(pos):
		return floor_matrix[pos.y][pos.x]
	return INVALID_POSITION

func print_floor() -> void:
	print("\nFloor Matrix:")
	for y in range(matrix_size):
		var row = ""
		for x in range(matrix_size):
			row += str(floor_matrix[y][x]) + " "
		print(row)
	
	
	#print(floor_matrix[22])
	#print(floor_matrix[23])
	#print(floor_matrix[24])
	#print(floor_matrix[25])
	#print(floor_matrix[26])
	#print(floor_matrix[27])
	#print(floor_matrix[28])
	#print(floor_matrix[29])

func add_connection(_door_from: Door, _door_to: Door) -> void:
	connections[_door_from] = _door_to
