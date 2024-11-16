class_name Enemy
extends Entity

@onready var aggro_area: Area2D = $AggroArea
@onready var collision_shape: CollisionShape2D = $AggroArea/CollisionShape2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

enum EnemyState { IDLE, WANDERING, CHASING, DEAD }
