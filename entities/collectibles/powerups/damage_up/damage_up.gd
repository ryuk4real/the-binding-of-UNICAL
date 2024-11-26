class_name DamageUp
extends Collectible

@export var damage_increase: int = 5

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.POWER_UP

func apply_effect(collector: Player) -> void:
	collector.damage += damage_increase
