extends Node2D

var n : int

var rayList = []
signal player_detected(distance : Vector2)
signal player_lost

func _ready() -> void:
	rayList = Array(get_children())

func _process(_delta: float) -> void:
	for ray in rayList:
		if ray.get_collider() is CharacterBody2D:
			player_detected.emit(ray.get_collider().global_position - ray.get_parent().global_position)
			n += 1
	if n == 0:
		player_lost.emit()
	n = 0
