class_name Worker
extends HTTPRequest

var response: Variant
var headers: Array
var content: Dictionary

var is_server_started: bool = false

func _ready() -> void:
	start_server()
	request_completed.connect(_on_request_completed)

func start_server() -> void:
	print("Server starting")
	
	match OS.get_name():
		"Windows":
			print("OS: Windows")
			# Global.PID = OS.create_process("poetry", ["-C", Global.SERVER_ROOT, "run", "python", Global.SERVER_PATH, "server"], true)
			Global.PID = OS.create_process("python", [Global.SERVER_PATH, "server"], true)
			
		"Linux":
			print("OS: Linux")
			Global.PID = OS.create_process("python3", [Global.SERVER_PATH, "server"], true)
	
	print("Server is starting...")
	await test_first_call()
	SignalBus.server_started.emit()
	print("Server started")
	
func shutdown_server() -> void:
	OS.kill(Global.PID)
	print("Server has been shut down")
	SignalBus.server_shut.emit()
	
func _on_request_completed(_result, _response_code, _headers, body) -> void:
	response = await JSON.parse_string(body.get_string_from_utf8())
	SignalBus.response_ready.emit()

func test_first_call():
	post("")
	await SignalBus.response_ready
	is_server_started = true

func post(_data: String) -> void:
	headers = ["Content-Type: application/json"]
	content = {
		"program": _data,
		"max_stable_models": Global.ALL_MODELS}
	var json: String = JSON.stringify(content)
	request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
