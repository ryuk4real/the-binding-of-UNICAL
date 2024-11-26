class_name Medikit
extends Collectible

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.HEALTH

func apply_effect(collector: Player) -> void:
	collector.heal(collector.max_hp)
