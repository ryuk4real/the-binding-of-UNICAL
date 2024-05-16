extends Node2D

signal server_started
signal server_shut

func _ready():
	start_server()
	
func start_server():
	print("Server starting")
	Global.pid = OS.create_process("python", ["./gdatalog/gdatalog_cli.py", "server"], true)

func shutdown_server():
	OS.kill(Global.pid)
	print("Server is shut down")
	emit_signal("server_shut")

func generate_floor(num_floor):
	pass


func _on_quit_pressed():
	shutdown_server()
