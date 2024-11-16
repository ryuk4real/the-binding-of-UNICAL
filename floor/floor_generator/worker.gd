class_name Worker
extends HTTPRequest

var response: Variant = {"models": 0}
var headers: Array
var content: Dictionary
var server_ready := false

func _ready() -> void:
	start_server()

func start_server() -> void:
	match OS.get_name():
		"Windows":
			print("OS: Windows")
			Global.PID = OS.create_process("python", [Global.SERVER_PATH, "server"], true)
		"Linux":
			print("OS: Linux")
			Global.PID = OS.create_process("python3", [Global.SERVER_PATH, "server"], true)
	
	print("Server process started, waiting for initialization...")
	await check_server_status()
	print("Server is fully initialized!")
	SignalBus.server_started.emit()

func check_server_status() -> void:
	while not server_ready:
		print("Attempting to connect to server...")
		headers = ["Content-Type: application/json"]
		content = {
			"program": "a.",
			"max_stable_models": Global.ALL_MODELS
		}
		var json: String = JSON.stringify(content)
		
		var error = request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
		if error != OK:
			print("Connection attempt failed with error: ", error)
			await get_tree().create_timer(0.5).timeout
			continue
			
		var result = await request_completed
		if result[0] == OK and result[1] == 200:
			server_ready = true
			print("Server responded successfully!")
			break
		else:
			print("Server not ready yet. Response code: ", result[1])
			await get_tree().create_timer(0.5).timeout

func _on_request_completed(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != OK:
		#print("Request failed with result: ", result)
		return
		
	if response_code != 200:
		print("Request failed with response code: ", response_code)
		return
		
	var json = JSON.new()
	var parse_result = json.parse(body.get_string_from_utf8())
	if parse_result == OK:
		response = json.get_data()
		SignalBus.response_ready.emit()
	else:
		print("JSON Parse Error: ", json.get_error_message())
		print("Error Line: ", json.get_error_line())

func post(_data: String) -> void:
	if not server_ready:
		print("Server not ready! Cannot make request.")
		return
		
	headers = ["Content-Type: application/json"]
	content = {
		"program": _data,
		"max_stable_models": Global.ALL_MODELS
	}
	var json: String = JSON.stringify(content)
	
	cancel_request()
	
	#print("Sending request: ", json)
	var error = request(Global.SERVER_URL, headers, HTTPClient.METHOD_POST, json)
	if error != OK:
		print("HTTP Request Error: ", error)
		return
		
	var result = await request_completed
	#print("Request completed with result: ", result)

func shutdown_server() -> void:
	if Global.PID > 0:
		OS.kill(Global.PID)
		print("Server has been shut down")
		SignalBus.server_shut.emit()
	server_ready = false
