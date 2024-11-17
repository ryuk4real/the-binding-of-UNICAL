class_name Entity
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collider: CollisionShape2D = $Collider
@onready var interaction_area: Area2D = $InteractionArea

var collision: KinematicCollision2D
var enabled: bool = true

func move(_delta: float) -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	pass
