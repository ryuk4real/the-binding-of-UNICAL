class_name Worker
extends HTTPRequest

var response
var headers: Array
var content: Dictionary

func _ready() -> void:
	start_server()
	request_completed.connect(_on_request_completed)

func start_server() -> void:
	print("Server starting")
	# Global.PID = OS.create_process("poetry", ["-C", Global.SERVER_ROOT, "run", "python", Global.SERVER_PATH, "server"], true)
	Global.PID = OS.create_process("python", [Global.SERVER_PATH, "server"], true)
	
	post("{}")
	await SignalBus.response_ready
	
	SignalBus.server_started.emit()
	print("server started signal emitted")
	
func shutdown_server() -> void:
	OS.kill(Global.PID)
	print("Server has been shut down")
	SignalBus.server_shut.emit()

func _on_request_completed(_result, _response_code, _headers, body) -> void:
	response = JSON.parse_string(body.get_string_from_utf8())
	SignalBus.response_ready.emit()

func post(_data: String) -> void:
	headers = ["Content-Type: application/json"]
	
	content = {
		"program": _data,
		"max_stable_models": Global.ALL_MODELS}
	var json = JSON.stringify(content)
	request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
