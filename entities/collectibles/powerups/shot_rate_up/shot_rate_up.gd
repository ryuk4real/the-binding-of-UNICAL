class_name ShotRateUp
extends Collectible

@export var shot_delay_reduction: int = 1
@export var min_shot_delay: int = 1

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.POWER_UP

func apply_effect(collector: Player) -> void:
	collector.shot_delay = max(min_shot_delay, collector.shot_delay - shot_delay_reduction)
