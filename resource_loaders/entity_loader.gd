class_name EntityLoader
extends Node2D

var player_loader: ResourcePreloader
var enemy_loader: ResourcePreloader

func _ready() -> void:
	player_loader = ResourcePreloader.new()
	enemy_loader = ResourcePreloader.new()

func load_resources() -> void:
	player_loader.add_resource(str(0), load(Global.PLAYER_RESOURCE_PATH))
	enemy_loader.add_resource(str(Global.ENEMY_TYPE_ZOMBIE), load(Global.ZOMBIE_RESOURCE_PATH))

func get_player() -> Player:
	var player_scene: Resource = player_loader.get_resource(str(0))
	return player_scene.instantiate()

func get_enemy(_enemy_type: int) -> Entity:
	var enemy_scene: Resource = enemy_loader.get_resource(str(_enemy_type))
	return enemy_scene.instantiate()
