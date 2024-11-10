extends Node2D

var player_loader: ResourcePreloader

func _ready() -> void:
	player_loader = ResourcePreloader.new()

func load_resources() -> void:
	player_loader.add_resource(str(0), load(Global.PLAYER_RESOURCE_PATH))

func get_player() -> Player:
	var player_scene = player_loader.get_resource(str(0))
	return player_scene.instantiate()
