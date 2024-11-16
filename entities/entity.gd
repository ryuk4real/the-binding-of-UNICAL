class_name Entity
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox = $Hitbox

var collision: KinematicCollision2D
var enabled: bool = true
var hp: int = 100

func move(_delta: float) -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	pass
