extends Node

const ROOM_TYPE_HALLWAY = 0
const ROOM_TYPE_INNER_HALLWAY = 1
const ROOM_TYPE_CLASSROOM = 2
const ROOM_TYPE_OFFICE = 3
const ROOM_TYPE_BATHROOM = 4
const ROOM_TYPE_LAB = 5

const TOTAL_HALLWAYS = 29
const TOTAL_INNER_HALLWAYS = 64
const TOTAL_LECTURE_HALLS = 4
const TOTAL_CLASSROOMS = 28
const TOTAL_OFFICES = 8
const TOTAL_BATHROOMS = 9
const TOTAL_LABS = 8

const HALLWAYS_PATH = "res://floor/rooms/hallway/"
const INNER_HALLWAYS_PATH = "res://floor/rooms/inner_hallway/"
const LECTURE_HALLS_PATH = "res://floor/rooms/classroom/lecture_hall/"
const STANDARD_CLASSROOMS_PATH = "res://floor/rooms/classroom/standard_classroom/"
const OFFICES_PATH = "res://floor/rooms/office/"
const BATHROOMS_PATH = "res://floor/rooms/bathroom/"
const LABS_PATH = "res://floor/rooms/labs/"

# The direction of the room the door is connected with
const DIRECTION_UP: int = 1
const DIRECTION_DOWN: int = -1
const DIRECTION_LEFT: int = 2
const DIRECTION_RIGHT: int = -2

const ROOM_GENERATOR_PROGRAM_PATH = "res://asp/room_generator.asp"
const ROOM_GENERATOR_TEMP_PATH = "res://asp/.room_generator_temp.asp"

const SERVER_ROOT = "./gdatalog"
const SERVER_PATH = "./gdatalog/gdatalog_cli.py"
const SERVER_URL = "http://127.0.0.1:8000/run/"
var PID: int = -1

const SATISFIABLE = "SAT"
const UNSATISFIABLE = "UNSAT"
const ALL_MODELS = 0
