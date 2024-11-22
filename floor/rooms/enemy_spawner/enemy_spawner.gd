class_name EnemySpawners
extends Node2D



func _ready() -> void:
	pass

func spawn(_enemy_id: int) -> void:
	if _enemy_id != Global.ENEMY_TYPE_NONE:
		var _enemy: Enemy = Global.entity_loader.get_enemy(_enemy_id)
		add_child(_enemy)
