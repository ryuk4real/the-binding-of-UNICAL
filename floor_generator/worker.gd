class_name Worker
extends HTTPRequest

signal server_started
signal server_shut
signal response_ready

var response

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start_server()
	request_completed.connect(_on_request_completed)

func _start_server() -> void:
	print("Server starting")
	Global.PID = OS.create_process("poetry", ["-C", Global.SERVER_ROOT, "run", "python", Global.SERVER_PATH, "server"], true)

func _shutdown_server() -> void:
	OS.kill(Global.PID)
	print("Server has been shut down")
	emit_signal("server_shut")

func _on_request_completed(result, response_code, headers, body) -> void:
	response = JSON.parse_string(body.get_string_from_utf8())
	print(response)
	emit_signal("response_ready")

func _on_quit_pressed() -> void:
	_shutdown_server()
	emit_signal("server_shut")

func post(_data: String) -> void:
	var headers = ["Content-Type: application/json"]
	var dict = {"program": _data}
	var json = JSON.stringify(dict)
	request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
