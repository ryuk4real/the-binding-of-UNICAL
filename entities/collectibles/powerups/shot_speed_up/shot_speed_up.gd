class_name ShotSpeedUp
extends Collectible

@export var speed_increase: float = 10.0

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.POWER_UP

func apply_effect(collector: Player) -> void:
	collector.shot_speed = min(collector.shot_speed + speed_increase, collector.max_speed)
