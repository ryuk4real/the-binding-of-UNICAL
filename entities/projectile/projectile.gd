class_name Projectile
extends Entity

@export var speed: float = 100
@export var damage: int = 10
var direction: Vector2
var range: float = 3
const RANGE_PENALTY: int = 2

func _ready() -> void:
	SignalBus.player_damage_changed.connect(_on_player_damage_changed)
	animated_sprite_2d.play("BASIC")

func _process(delta: float) -> void:
	if not enabled:
		return
		
	position += direction * speed * delta
	range -= delta * RANGE_PENALTY
	
	collision = move_and_collide(velocity * delta)
	
	if collision:
		death_animation_start()
	
	if range <= 0:
		death_animation_start()

func _on_player_damage_changed() -> void:
	damage = Global.player.damage

func death_animation_start() -> void:
	if not enabled:
		return
		
	enabled = false
	animated_sprite_2d.play("DEATH")
	await animated_sprite_2d.animation_finished
	queue_free()
