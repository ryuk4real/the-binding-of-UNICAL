class_name UIManager
extends CanvasLayer

@onready var new_game_button = $"MainMenu/MarginContainer/VBoxContainer/VBoxContainer/New Game"
@onready var main_menu = $MainMenu
@onready var gui = $GUI
@onready var loading_screen = $LoadingScreen

func _ready():
	new_game_button.grab_focus()

func _process(delta):
	pass

func show_main_menu():
	new_game_button.grab_focus()
	loading_screen.visible = false
	gui.visible = false
	main_menu.visible = true

func show_gui():
	main_menu.visible = false
	loading_screen.visible = false
	gui.visible = true

func show_loading_screen():
	main_menu.visible = false
	gui.visible = false
	loading_screen.visible = true
