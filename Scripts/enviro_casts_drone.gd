extends Node2D


var ray : RayCast2D


signal wall_dect

func _ready() -> void:
	ray = $RayCast2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray.get_collider() is StaticBody2D:
		wall_dect.emit()
