class_name Medikit
extends Collectible

@export var heal_amount: float = 25.0

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.HEALTH

func apply_effect(collector: Player) -> void:
	collector.heal(heal_amount)
