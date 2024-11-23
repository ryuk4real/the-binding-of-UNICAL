class_name Transitioner
extends Control

@onready var texture_rect: TextureRect = $TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.transitioner = self
	show()
	texture_rect.visible = false

func set_next_animation(_fading_out: bool):
	if _fading_out:
		animation_player.queue("FADE_OUT")
	else:
		animation_player.queue("FADE_IN")
