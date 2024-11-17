class_name EnemySpawners
extends Node2D



func _ready() -> void:
	var student: Student = Global.entity_loader.get_enemy(Global.ENEMY_TYPE_STUDENT)
	add_child(student)
	
	# TODO: get enemy from worker call
	pass
