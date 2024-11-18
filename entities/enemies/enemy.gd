class_name Enemy
extends Entity

@onready var aggro_area: Area2D = $AggroArea
@onready var collision_shape: CollisionShape2D = $AggroArea/CollisionShape2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

enum EnemyState { IDLE, WANDERING, CHASING, DEAD, SHOOTING }

@export var max_hp: int = 100
@export var current_hp: int = 100
@export var damage: int = 10

func _ready() -> void:
	pass

func take_damage(amount: int) -> void:
	current_hp = max(0, current_hp - amount)
	
	# Optional: Play hit animation or effects here
	if animated_sprite_2d:
		animated_sprite_2d.modulate = Color.RED
		# Reset color after a short delay
		await get_tree().create_timer(0.1).timeout
		animated_sprite_2d.modulate = Color.WHITE
		
	print(current_hp)
	
	if current_hp <= 0:
		SignalBus.enemy_died.emit()
		die()

func die() -> void:
	# TODO: Play death animation
	queue_free()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	# Check if the area belongs to a projectile
	var projectile = area.get_parent()
	if projectile is PlayerProjectile:
		take_damage(projectile.damage)
		projectile.queue_free()
