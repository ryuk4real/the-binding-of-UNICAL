extends Node

const ROOM_TYPE_HALLWAY = 0
const ROOM_TYPE_INNER_HALLWAY = 1
const ROOM_TYPE_BATHROOM = 2
const ROOM_TYPE_CLASSROOM = 3
const ROOM_TYPE_OFFICE = 4
const ROOM_TYPE_STORAGE = 5
const ROOM_TYPE_LIBRARY = 6
const ROOM_TYPE_NONE = 999

# The direction of the room the door is connected with
const DIRECTION_UP: int = 1
const DIRECTION_DOWN: int = -1
const DIRECTION_LEFT: int = 2
const DIRECTION_RIGHT: int = -2

const PLACE_STARTING_ROOM_PROGRAM_PATH = "res://asp/place_starting_room.asp"
const PLACE_STARTING_ROOM_PROGRAM_PATH_TEMP = "res://asp/place_starting_room_temp.asp"
const PLACE_GENERIC_ROOM_PROGRAM_PATH = "res://asp/place_generic_room.asp"
const PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP = "res://asp/place_generic_room_temp.asp"
const HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH = "res://asp/hallway_neighbour_type_guesser.asp"
const INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH = "res://asp/inner_hallway_neighbour_type_guesser.asp"
const CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH = "res://asp/classroom_neighbour_type_guesser.asp"
const LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH = "res://asp/library_neighbour_type_guesser.asp"

const HALLWAY_ROOM_UP_COUNTER = 1
const HALLWAY_UP_FOLDER_PATH = "res://floor/rooms/hallway/up/"

const HALLWAY_ROOM_DOWN_COUNTER = 1
const HALLWAY_DOWN_FOLDER_PATH = "res://floor/rooms/hallway/down/"

const HALLWAY_ROOM_LEFT_COUNTER = 1
const HALLWAY_LEFT_FOLDER_PATH = "res://floor/rooms/hallway/left/"

const HALLWAY_ROOM_RIGHT_COUNTER = 1
const HALLWAY_RIGHT_FOLDER_PATH = "res://floor/rooms/hallway/right/"


const INNER_HALLWAY_ROOM_DOWN_COUNTER = 1
const INNER_HALLWAY_DOWN_FOLDER_PATH = "res://floor/rooms/inner_hallway/down/"

const INNER_HALLWAY_ROOM_UP_COUNTER = 1
const INNER_HALLWAY_UP_FOLDER_PATH = "res://floor/rooms/inner_hallway/up/"

const INNER_HALLWAY_ROOM_LEFT_COUNTER = 1
const INNER_HALLWAY_LEFT_FOLDER_PATH = "res://floor/rooms/inner_hallway/left/"

const INNER_HALLWAY_ROOM_RIGHT_COUNTER = 1
const INNER_HALLWAY_RIGHT_FOLDER_PATH = "res://floor/rooms/inner_hallway/right/"


const BATHROOM_ROOM_DOWN_COUNTER = 1
const BATHROOM_DOWN_FOLDER_PATH = "res://floor/rooms/bathroom/down/"

const BATHROOM_ROOM_UP_COUNTER = 1
const BATHROOM_UP_FOLDER_PATH = "res://floor/rooms/bathroom/up/"

const BATHROOM_ROOM_LEFT_COUNTER = 1
const BATHROOM_LEFT_FOLDER_PATH = "res://floor/rooms/bathroom/left/"

const BATHROOM_ROOM_RIGHT_COUNTER = 1
const BATHROOM_RIGHT_FOLDER_PATH = "res://floor/rooms/bathroom/right/"


const LAB_ROOM_DOWN_COUNTER = 1
const LAB_DOWN_FOLDER_PATH = "res://floor/rooms/classroom/lab/down/"

const LAB_ROOM_UP_COUNTER = 1
const LAB_UP_FOLDER_PATH = "res://floor/rooms/classroom/lab/up/"

const LAB_ROOM_LEFT_COUNTER = 1
const LAB_LEFT_FOLDER_PATH = "res://floor/rooms/classroom/lab/left/"

const LAB_ROOM_RIGHT_COUNTER = 1
const LAB_RIGHT_FOLDER_PATH = "res://floor/rooms/classroom/lab/right/"


const STANDARD_CLASSROOM_ROOM_DOWN_COUNTER = 1
const STANDARD_CLASSROOM_DOWN_FOLDER_PATH = "res://floor/rooms/classroom/standard_classroom/down/"

const STANDARD_CLASSROOM_ROOM_UP_COUNTER = 1
const STANDARD_CLASSROOM_UP_FOLDER_PATH = "res://floor/rooms/classroom/standard_classroom/up/"

const STANDARD_CLASSROOM_ROOM_LEFT_COUNTER = 1
const STANDARD_CLASSROOM_LEFT_FOLDER_PATH = "res://floor/rooms/classroom/standard_classroom/left/"

const STANDARD_CLASSROOM_ROOM_RIGHT_COUNTER = 1
const STANDARD_CLASSROOM_RIGHT_FOLDER_PATH = "res://floor/rooms/classroom/standard_classroom/right/"

const ASP_PATH = "res://asp/"


const SERVER_ROOT = "./gdatalog"
const SERVER_PATH = "./gdatalog/gdatalog_cli.py"
const SERVER_URL = "http://127.0.0.1:8000/run/"
var PID: int = -1

const SATISFIABLE = "SAT"
const UNSATISFIABLE = "UNSAT"
const ALL_MODELS = 0

const MAP_SIZE = 10
var current_room_type = 0

const PLAYER_LAYER: int = 1
const ENEMIES_LAYER: int = 2
const PICKUPS_LAYER: int = 3
const OBSTACLES_LAYER: int = 4
const WALLS_LAYER: int = 5
const DOOR_LAYER: int = 6
