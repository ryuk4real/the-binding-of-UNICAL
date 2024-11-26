class_name SpeedUp
extends Collectible

@export var speed_increase: float = 25.0

func _ready() -> void:
	super._ready()
	collectible_type = CollectibleType.POWER_UP

func apply_effect(collector: Player) -> void:
	collector.speed = min(collector.speed + speed_increase, collector.max_speed)
