class_name UIManager
extends CanvasLayer

@onready var new_game_button_main_menu: Button = $"MainMenu/MarginContainer/VBoxContainer/VBoxContainer/New Game"
@onready var main_menu_button: Button = $"GameOver/MarginContainer/VBoxContainer/VBoxContainer/Main Menu"
@onready var main_menu: Control = $MainMenu
@onready var gui: Control = $GUI
@onready var loading_screen: Control = $LoadingScreen
@onready var game_over: Control = $GameOver

func _ready() -> void:
	new_game_button_main_menu.grab_focus()

func _process(_delta: float) -> void:
	pass

func show_main_menu() -> void:
	new_game_button_main_menu.grab_focus()
	loading_screen.hide()
	gui.hide()
	main_menu.show()
	game_over.hide()

func show_gui() -> void:
	main_menu.hide()
	loading_screen.hide()
	gui.show()
	game_over.hide()
	

func show_loading_screen() -> void:
	main_menu.hide()
	gui.hide()
	loading_screen.show()
	game_over.hide()

func show_game_over_screen() -> void:
	main_menu.hide()
	gui.hide()
	loading_screen.hide()
	game_over.show()
	main_menu_button.grab_focus()
