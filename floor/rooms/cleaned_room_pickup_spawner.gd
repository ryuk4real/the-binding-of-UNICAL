extends Marker2D

@onready var room: Node2D = $"../.."

var is_room_with_enemy: bool
var collectible: Collectible

func _ready() -> void:
	pass

func spawn() -> void:
	#print("Is room with enemy: %s" % is_room_with_enemy)
	if is_room_with_enemy:
		collectible = await get_collectible()
		
		if collectible != null:
			add_child(collectible)
			#print("spawned collectible: %s" % collectible)

func get_collectible() -> Collectible:
	var collectible_type: int = await _get_collectible_type(Global.player.atoms)
	#print("Collectible type %s" % collectible_type)
	
	if collectible_type != Global.COLLECTIBLE_TYPE_NONE:
		return Global.entity_loader.get_collectible(collectible_type)
	
	return null

func _get_answerset_from_worker(_program: String) -> Array:
	Global.worker.post(_program)
	await SignalBus.response_ready
	await Global.worker.response
	var response = Global.worker.response.get("models")
	return response

func _get_collectible_type(_player_atoms: Array[String] = []) -> int:
	var stringified_atoms: String = Global.collectible_program
	
	for string: String in _player_atoms:
		stringified_atoms += string
	
	var answer_set: Array = await _get_answerset_from_worker(stringified_atoms)
	print(answer_set)
	return answer_set[0][0].get("arguments")[0].get("number")
