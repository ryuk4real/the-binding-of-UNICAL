class_name ShotRateUp
extends Collectible

@export var shot_delay_reduction: float = 0.1
@export var min_shot_delay: float = 0.1

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.POWER_UP

func apply_effect(collector: Player) -> void:
	collector.shoot_delay = max(min_shot_delay, collector.shoot_delay - shot_delay_reduction)
