extends Node

const ROOM_TYPE_HALLWAY: int = 0
const ROOM_TYPE_INNER_HALLWAY: int = 1
const ROOM_TYPE_BATHROOM: int = 2
const ROOM_TYPE_CLASSROOM: int = 3
const ROOM_TYPE_OFFICE: int = 4
const ROOM_TYPE_STORAGE: int = 5
const ROOM_TYPE_LIBRARY: int = 6
const ROOM_TYPE_NONE: int = 999

const ENEMY_TYPE_ZOMBIE: int = 0
const ENEMY_TYPE_STUDENT: int = 1
const ENEMY_TYPE_NONE: int = 999

const COLLECTIBLE_TYPE_MEDIKIT: int = 0
const COLLECTIBLE_TYPE_BANDAGES: int = 1
const COLLECTIBLE_TYPE_SPEED_UP: int = 2
const COLLECTIBLE_TYPE_SHOT_SPEED_UP: int = 3
const COLLECTIBLE_TYPE_SHOT_RATE_UP: int = 4
const COLLECTIBLE_TYPE_DAMAGE_UP: int = 5
const COLLECTIBLE_TYPW_NONE: int = 999

# The direction of the room the door is connected with
const DIRECTION_UP: int = 1
const DIRECTION_DOWN: int = -1
const DIRECTION_LEFT: int = 2
const DIRECTION_RIGHT: int = -2

const PLAYER_RESOURCE_PATH: String = "res://entities/player/player.tscn"

const ZOMBIE_RESOURCE_PATH: String = "res://entities/enemies/zombie/zombie.tscn"
const STUDENT_RESOURCE_PATH: String = "res://entities/enemies/student/student.tscn"

const COLLECTIBLE_MEDIKIT_PATH: String = "res://entities/collectibles/health_related/medikit/medikit.tscn"
const COLLECTIBLE_BANDAGES_PATH: String = "res://entities/collectibles/health_related/bandages/bandages.tscn"
const COLLECTIBLE_SHOT_SPEED_UP_PATH: String = "res://entities/collectibles/powerups/shot_speed_up/shot_speed_up.tscn"
const COLLECTIBLE_SHOT_RATE_UP_PATH: String = "res://entities/collectibles/powerups/shot_rate_up/shot_rate_up.tscn"
const COLLECTIBLE_DAMAGE_UP_PATH: String = "res://entities/collectibles/powerups/damage_up/damage_up.tscn"
const COLLECTIBLE_SPEED_UP: String = "res://entities/collectibles/powerups/speed_up/speed_up.tscn"

var player: Player = null
var current_room: Room = null
var current_floor: Floor = null
var transitioner: Transitioner = null
var game_scene: Node2D = null
var projectiles_scene: Node2D = null
var entity_loader: EntityLoader = null
var collectible_loader: Node2D = null

const HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH: String = "res://asp/hallway_neighbour_type_guesser.asp"
const INNER_HALLWAY_NEIGHBOUR_TYPE_GUESSER_PATH: String = "res://asp/inner_hallway_neighbour_type_guesser.asp"
const CLASSROOM_NEIGHBOUR_TYPE_GUESSER_PATH: String = "res://asp/classroom_neighbour_type_guesser.asp"
const LIBRARY_NEIGHBOUR_TYPE_GUESSER_PATH: String = "res://asp/library_neighbour_type_guesser.asp"

const ENEMY_TYPE_GUESSER_PATH: String = "res://asp/enemy_type_guesser.asp"

const COLLECTIBLE_TYPE_GUESSER_PATH: String = "res://asp/collectible_type_guesser.asp"
var collectible_program: String

const HALLWAY_ROOM_UP_COUNTER: int = 1
const HALLWAY_UP_FOLDER_PATH: String = "res://floor/rooms/hallway/up/"

const HALLWAY_ROOM_DOWN_COUNTER: int = 1
const HALLWAY_DOWN_FOLDER_PATH = "res://floor/rooms/hallway/down/"

const HALLWAY_ROOM_LEFT_COUNTER = 1
const HALLWAY_LEFT_FOLDER_PATH: String = "res://floor/rooms/hallway/left/"

const HALLWAY_ROOM_RIGHT_COUNTER = 1
const HALLWAY_RIGHT_FOLDER_PATH: String = "res://floor/rooms/hallway/right/"


const INNER_HALLWAY_ROOM_DOWN_COUNTER: int = 1
const INNER_HALLWAY_DOWN_FOLDER_PATH: String = "res://floor/rooms/inner_hallway/down/"

const INNER_HALLWAY_ROOM_UP_COUNTER: int = 1
const INNER_HALLWAY_UP_FOLDER_PATH: String = "res://floor/rooms/inner_hallway/up/"

const INNER_HALLWAY_ROOM_LEFT_COUNTER: int = 1
const INNER_HALLWAY_LEFT_FOLDER_PATH: String = "res://floor/rooms/inner_hallway/left/"

const INNER_HALLWAY_ROOM_RIGHT_COUNTER: int = 1
const INNER_HALLWAY_RIGHT_FOLDER_PATH: String = "res://floor/rooms/inner_hallway/right/"


const BATHROOM_ROOM_DOWN_COUNTER: int = 1
const BATHROOM_DOWN_FOLDER_PATH: String = "res://floor/rooms/bathroom/down/"

const BATHROOM_ROOM_UP_COUNTER: int = 1
const BATHROOM_UP_FOLDER_PATH: String = "res://floor/rooms/bathroom/up/"

const BATHROOM_ROOM_LEFT_COUNTER: int = 1
const BATHROOM_LEFT_FOLDER_PATH: String = "res://floor/rooms/bathroom/left/"

const BATHROOM_ROOM_RIGHT_COUNTER: int = 1
const BATHROOM_RIGHT_FOLDER_PATH: String = "res://floor/rooms/bathroom/right/"


const LAB_ROOM_DOWN_COUNTER: int = 1
const LAB_DOWN_FOLDER_PATH: String = "res://floor/rooms/classroom/lab/down/"

const LAB_ROOM_UP_COUNTER: int = 1
const LAB_UP_FOLDER_PATH: String = "res://floor/rooms/classroom/lab/up/"

const LAB_ROOM_LEFT_COUNTER: int = 1
const LAB_LEFT_FOLDER_PATH: String = "res://floor/rooms/classroom/lab/left/"

const LAB_ROOM_RIGHT_COUNTER: int = 1
const LAB_RIGHT_FOLDER_PATH: String = "res://floor/rooms/classroom/lab/right/"


const STANDARD_CLASSROOM_ROOM_DOWN_COUNTER: int = 1
const STANDARD_CLASSROOM_DOWN_FOLDER_PATH: String = "res://floor/rooms/classroom/standard_classroom/down/"

const STANDARD_CLASSROOM_ROOM_UP_COUNTER: int = 1
const STANDARD_CLASSROOM_UP_FOLDER_PATH: String = "res://floor/rooms/classroom/standard_classroom/up/"

const STANDARD_CLASSROOM_ROOM_LEFT_COUNTER: int = 1
const STANDARD_CLASSROOM_LEFT_FOLDER_PATH: String = "res://floor/rooms/classroom/standard_classroom/left/"

const STANDARD_CLASSROOM_ROOM_RIGHT_COUNTER: int = 1
const STANDARD_CLASSROOM_RIGHT_FOLDER_PATH: String = "res://floor/rooms/classroom/standard_classroom/right/"


const OFFICE_ROOM_DOWN_COUNTER: int = 1
const OFFICE_DOWN_FOLDER_PATH: String = "res://floor/rooms/office/down/"

const OFFICE_ROOM_UP_COUNTER: int = 1
const OFFICE_UP_FOLDER_PATH: String = "res://floor/rooms/office/up/"

const OFFICE_ROOM_LEFT_COUNTER: int = 1
const OFFICE_LEFT_FOLDER_PATH: String = "res://floor/rooms/office/left/"

const OFFICE_ROOM_RIGHT_COUNTER: int = 1
const OFFICE_RIGHT_FOLDER_PATH: String = "res://floor/rooms/office/right/"


const LIBRARY_ROOM_DOWN_COUNTER: int = 1
const LIBRARY_DOWN_FOLDER_PATH: String = "res://floor/rooms/library/down/"

const LIBRARY_ROOM_UP_COUNTER: int = 1
const LIBRARY_UP_FOLDER_PATH: String = "res://floor/rooms/library/up/"

const LIBRARY_ROOM_LEFT_COUNTER: int = 1
const LIBRARY_LEFT_FOLDER_PATH: String = "res://floor/rooms/library/left/"

const LIBRARY_ROOM_RIGHT_COUNTER: int = 1
const LIBRARY_RIGHT_FOLDER_PATH: String = "res://floor/rooms/library/right/"


const STORAGE_ROOM_DOWN_COUNTER: int = 1
const STORAGE_DOWN_FOLDER_PATH: String = "res://floor/rooms/storage/down/"

const STORAGE_ROOM_UP_COUNTER: int = 1
const STORAGE_UP_FOLDER_PATH: String = "res://floor/rooms/storage/up/"

const STORAGE_ROOM_LEFT_COUNTER: int = 1
const STORAGE_LEFT_FOLDER_PATH: String= "res://floor/rooms/storage/left/"

const STORAGE_ROOM_RIGHT_COUNTER: int = 1
const STORAGE_RIGHT_FOLDER_PATH: String = "res://floor/rooms/storage/right/"

const ASP_PATH: String = "res://asp/"

var worker = null

const SERVER_ROOT: String = "./gdatalog"
const SERVER_PATH: String = "./gdatalog/gdatalog_cli.py"
const SERVER_URL: String = "http://127.0.0.1:8000/run/"
var PID: int = -1

const SATISFIABLE: String = "SAT"
const UNSATISFIABLE: String = "UNSAT"
const ALL_MODELS = 0

const ROOM_LIMIT: int = 15
const MAP_SIZE: int = 15
var current_room_type: int = 0

const PLAYER_LAYER: int = 1
const ENEMIES_LAYER: int = 2
const PICKUPS_LAYER: int = 3
const OBSTACLES_LAYER: int = 4
const WALLS_LAYER: int = 5
const DOOR_LAYER: int = 6
