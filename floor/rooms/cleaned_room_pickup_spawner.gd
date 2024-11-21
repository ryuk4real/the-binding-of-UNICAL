extends Marker2D

@onready var room = $"../.."

var is_room_with_enemy: bool
var collectible: Collectible

func _ready() -> void:
	if is_room_with_enemy:
		choose_collectible()

func choose_collectible() -> Collectible:
	var collectible_type = await _get_collectible_type()
	return Global.entity_loader.get_collectible(collectible_type)

func _get_answerset_from_worker(_program: String) -> Array:
	Global.worker.post(_program)
	await SignalBus.response_ready
	await Global.worker.response
	var response = Global.worker.response.get("models")
	return response

func _get_collectible_type(_floor_facts: Array = []) -> int:
	var answer_set: Array = await _get_answerset_from_worker(Global.collectible_program)
	return answer_set[0][0].get("arguments")[0].get("number")
	
	
