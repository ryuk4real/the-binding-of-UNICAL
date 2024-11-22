class_name EntityLoader
extends Node2D

var player_loader: ResourcePreloader
var enemy_loader: ResourcePreloader
var collectable_loader: ResourcePreloader

func _ready() -> void:
	player_loader = ResourcePreloader.new()
	enemy_loader = ResourcePreloader.new()
	collectable_loader = ResourcePreloader.new()

func load_resources() -> void:
	player_loader.add_resource(str(0), load(Global.PLAYER_RESOURCE_PATH))
	
	enemy_loader.add_resource(str(Global.ENEMY_TYPE_ZOMBIE), load(Global.ZOMBIE_RESOURCE_PATH))
	enemy_loader.add_resource(str(Global.ENEMY_TYPE_STUDENT), load(Global.STUDENT_RESOURCE_PATH))
	
	collectable_loader.add_resource(str(Global.COLLECTIBLE_TYPE_MEDIKIT), load(Global.COLLECTIBLE_MEDIKIT_PATH))
	collectable_loader.add_resource(str(Global.COLLECTIBLE_TYPE_BANDAGES), load(Global.COLLECTIBLE_BANDAGES_PATH))
	collectable_loader.add_resource(str(Global.COLLECTIBLE_TYPE_SHOT_SPEED_UP), load(Global.COLLECTIBLE_SHOT_SPEED_UP_PATH))
	collectable_loader.add_resource(str(Global.COLLECTIBLE_TYPE_SHOT_RATE_UP), load(Global.COLLECTIBLE_SHOT_RATE_UP_PATH))
	collectable_loader.add_resource(str(Global.COLLECTIBLE_DAMAGE_UP_PATH), load(Global.COLLECTIBLE_DAMAGE_UP_PATH))
	collectable_loader.add_resource(str(Global.COLLECTIBLE_SPEED_UP), load(Global.COLLECTIBLE_SHOT_SPEED_UP_PATH))
	
func get_player() -> Player:
	var player_scene: Resource = player_loader.get_resource(str(0))
	return player_scene.instantiate()

func get_enemy(_enemy_type: int) -> Entity:
	var enemy_scene: Resource = enemy_loader.get_resource(str(_enemy_type))
	return enemy_scene.instantiate()

func get_collectible(_collectible_type: int) -> Collectible:
	var collectible_scene: Resource = collectable_loader.get_resource(str(_collectible_type))
	return collectible_scene.instancitate()
	
