class_name EnemySpawners
extends Node2D



func _ready() -> void:
	var zombie: Zombie = Global.entity_loader.get_enemy(Global.ENEMY_TYPE_ZOMBIE)
	add_child(zombie)
	
	# TODO: get enemy from worker call
	pass
