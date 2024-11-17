extends TextureProgressBar

func _ready() -> void:
	SignalBus.player_health_changed.connect(update)

func update() -> void:
	if Global.player:
		value = Global.player.current_hp * 100 / Global.player.max_hp
