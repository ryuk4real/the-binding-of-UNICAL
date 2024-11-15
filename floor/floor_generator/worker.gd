class_name Worker
extends HTTPRequest

var response: Variant = {"models": 0}
var headers: Array
var content: Dictionary

func _ready() -> void:
	start_server()

func _process(delta) -> void:
	pass

func start_server() -> void:
	
	response = {"response": 0}
	
	match OS.get_name():
		"Windows":
			print("OS: Windows")
			# Global.PID = OS.create_process("poetry", ["-C", Global.SERVER_ROOT, "run", "python", Global.SERVER_PATH, "server"], true)
			Global.PID = OS.create_process("python", [Global.SERVER_PATH, "server"], true)
			
		"Linux":
			print("OS: Linux")
			Global.PID = OS.create_process("python3", [Global.SERVER_PATH, "server"], true)
	
	print("Server is starting...")

	post("a.")
	response = null
	await SignalBus.response_ready
	cancel_request()
	SignalBus.server_started.emit()
	print("Server started")
	
func shutdown_server() -> void:
	OS.kill(Global.PID)
	print("Server has been shut down")
	SignalBus.server_shut.emit()
	
func _on_request_completed(_result, _response_code, _headers, body) -> void:
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	response = await json.get_data()
	
	SignalBus.response_ready.emit()
	
func post(_data: String) -> void:
	headers = ["Content-Type: application/json"]
	content = {
		"program": _data,
		"max_stable_models": Global.ALL_MODELS}
	var json: String = JSON.stringify(content)
	await request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
	await SignalBus.response_ready
