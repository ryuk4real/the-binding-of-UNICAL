class_name Collectible
extends CharacterBody2D

signal collected(collector)

enum CollectibleType {
	HEALTH,
	POWER_UP,
	COIN,
	KEY,
	# Add more types as needed
}

@export var collectible_type: CollectibleType
@export var value: float = 1.0
@export var auto_collect: bool = true
@export var destroy_on_collect: bool = true

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var interaction_area: Area2D = $InteractionArea
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_collected: bool = false

func _ready() -> void:
	if animated_sprite:
		animated_sprite.play("IDLE")

func collect(collector: Player) -> void:
	if is_collected:
		return
		
	is_collected = true

	collected.emit(collector)
	apply_effect(collector)
	
	if destroy_on_collect:
		queue_free()

func apply_effect(_collector: Player) -> void:
	pass

func _on_interaction_area_body_entered(body):
	if is_collected:
		return
		
	if auto_collect and body.has_method("can_collect"):
		if body.can_collect(self):
			collect(body)
