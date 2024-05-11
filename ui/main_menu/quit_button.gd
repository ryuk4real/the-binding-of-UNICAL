extends Button

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	save_data()
	get_tree().quit()

func save_data():
	pass
