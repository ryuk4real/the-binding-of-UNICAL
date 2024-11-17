class_name Projectile
extends Entity

@export var speed: float = 100
@export var damage: int = 10
var direction: Vector2
var range: float = 3

const RANGE_PENALTY: int = 2

func _ready() -> void:
	SignalBus.player_damage_changed.connect(_on_player_damage_changed)

func _process(_delta: float) -> void:
	position += direction * speed * _delta
	range -= _delta * RANGE_PENALTY
	
	if range <= 0:
		#TODO: Instead of queue_free right away make it collapse
		queue_free()

func _on_player_damage_changed() -> void:
	damage = Global.player.damage
