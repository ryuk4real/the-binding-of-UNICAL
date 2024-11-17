extends Node

signal server_started
signal server_shut
signal response_ready

signal door_entered(_door: Door)

signal player_health_changed
signal player_damage_changed
signal player_damaged(damage_amount: int)
signal player_health_reached_zero

signal student_damage_changed(amount: int)
