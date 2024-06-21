extends Node

const ROOM_TYPE_HALLWAY = 0
const ROOM_TYPE_INNER_HALLWAY = 1
const ROOM_TYPE_STANDARD_CLASSROOM = 2
const ROOM_TYPE_LECTURE_HALL = 3
const ROOM_TYPE_OFFICE = 4
const ROOM_TYPE_BATHROOM = 5

# The direction of the room the door is connected with
const DIRECTION_UP: int = 1
const DIRECTION_DOWN: int = -1
const DIRECTION_LEFT: int = 2
const DIRECTION_RIGHT: int = -2

const ROOM_GENERATOR_PROGRAM_PATH = "res://asp/room_generator.asp"

const SERVER_PATH = "./gdatalog/gdatalog_cli.py"
const SERVER_URL = "http://127.0.0.1:8000/"
var PID: int = -1

var hallways = {}
var bathrooms = {}
var standard_classrooms = {}
var lecture_halls = {}
var offices = {}
