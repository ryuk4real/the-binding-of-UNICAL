extends Node2D


func _ready() -> void:
	Global.main_scene = self
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$UI/MainMenu.visible = true
	$UI/GUI.visible = false


func _process(delta) -> void:
	pass
