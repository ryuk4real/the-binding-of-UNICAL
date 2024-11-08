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
	place_room(_starting_room, Vector2i(center, center))
	
func place_room(room: Room, target_pos: Vector2i) -> bool:
	# Check if the target position is valid
	if not can_place_room(room, target_pos):
		return false

	# Place the room in the matrix
	for coord in room.coordinates:
		var x = target_pos.x + coord.x
		var y = target_pos.y + coord.y
		floor_matrix[y][x] = room.id
		
		# Check if coord is a coord of a door and update the map_position inside the door
		for door in room.doors:
			var door_tile_pos = room.get_door_room_position(door)
		
			if door_tile_pos == coord:
				door.map_position = Vector2i(y, x)

	rooms.append(room)
	
	return true

func is_valid_matrix_position(pos: Vector2i) -> bool:
	return pos.x >= 0 and pos.x < matrix_size and pos.y >= 0 and pos.y < matrix_size

func can_place_room(room: Room, target_pos: Vector2i) -> bool:
	# Check if the target position is valid
	if not is_valid_matrix_position(target_pos):
		return false

	# Check if the target position is already occupied
	if get_matrix_value(target_pos) != EMPTY_CELL:
		return false

	# Check if the room's coordinates fit
	var room_size = room.coordinates.size()
	for coord in room.coordinates:
		var x = target_pos.x + coord.x
		var y = target_pos.y + coord.y
		
		if not is_valid_matrix_position(Vector2i(x, y)):
			return false
		if get_matrix_value(Vector2i(x, y)) != EMPTY_CELL:
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

func add_connection(_door_from: Door, _door_to: Door) -> void:
	connections[_door_from] = _door_to
