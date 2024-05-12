extends Button

func _button_pressed():
	save_data()
	

func save_data():
	pass

func _on_floor_generator_server_shut():
	get_tree().quit()
