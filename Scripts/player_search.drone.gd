extends Node2D

var n : int

var rayList = []
signal player_detected(node : Node2D)
signal player_lost

func _ready() -> void:
	rayList = Array(get_children())

func _process(_delta: float) -> void:
	for ray in rayList:
		if ray.get_collider() is CharacterBody2D and ray.get_collider().name == "Killer":
			player_detected.emit(ray.get_collider())
			n += 1
	if n == 0:
		player_lost.emit()
	n = 0
