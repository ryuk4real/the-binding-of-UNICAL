extends Node

const ROOM_TYPE_HALLWAY = 0
const ROOM_TYPE_INNER_HALLWAY = 1
const ROOM_TYPE_CLASSROOM = 2
const ROOM_TYPE_OFFICE = 3
const ROOM_TYPE_BATHROOM = 4

# The direction of the room the door is connected with
const DIRECTION_UP: int = 1
const DIRECTION_DOWN: int = -1
const DIRECTION_LEFT: int = 2
const DIRECTION_RIGHT: int = -2

const PLACE_STARTING_ROOM_PROGRAM_PATH = "res://asp/place_starting_room.asp"
const PLACE_STARTING_ROOM_PROGRAM_PATH_TEMP = "res://asp/place_starting_room_temp.asp"
const PLACE_GENERIC_ROOM_PROGRAM_PATH = "res://asp/place_generic_room.asp"
const PLACE_GENERIC_ROOM_PROGRAM_PATH_TEMP = "res://asp/place_generic_room_temp.asp"


const ASP_PATH = "res://asp/"

const SERVER_ROOT = "./gdatalog"
const SERVER_PATH = "./gdatalog/gdatalog_cli.py"
const SERVER_URL = "http://127.0.0.1:8000/run/"
var PID: int = -1

const SATISFIABLE = "SAT"
const UNSATISFIABLE = "UNSAT"
const ALL_MODELS = 0

const MAP_SIZE = 50
const CENTER_COORDINATES: Vector2i = Vector2i(MAP_SIZE / 2, MAP_SIZE / 2)
const SPAWN_RADIUS: int = (MAP_SIZE / 2) - 2 

const PLAYER_LAYER: int = 1
const ENEMIES_LAYER: int = 2
const PICKUPS_LAYER: int = 3
const OBSTACLES_LAYER: int = 4
const WALLS_LAYER: int = 5
const DOOR_LAYER: int = 6
