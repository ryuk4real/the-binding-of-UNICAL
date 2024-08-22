class_name UIManager
extends CanvasLayer

@onready var new_game_button: Button = $"MainMenu/MarginContainer/VBoxContainer/VBoxContainer/New Game"
@onready var main_menu: Control = $MainMenu
@onready var gui: Control = $GUI
@onready var loading_screen: Control = $LoadingScreen

func _ready() -> void:
	new_game_button.grab_focus()

func _process(_delta: float) -> void:
	pass

func show_main_menu() -> void:
	new_game_button.grab_focus()
	loading_screen.visible = false
	gui.visible = false
	main_menu.visible = true

func show_gui() -> void:
	main_menu.visible = false
	loading_screen.visible = false
	gui.visible = true

func show_loading_screen() -> void:
	main_menu.visible = false
	gui.visible = false
	loading_screen.visible = true
