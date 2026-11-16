extends Node2D

var floor_ray : RayCast2D
var wall_ray : RayCast2D

var wall : bool
var floor_ : bool

signal wall_dect
signal floor_dect

func _ready() -> void:
	floor_ray = $RayCast2D2
	wall_ray = $RayCast2D

func _process(delta: float) -> void:
	if wall_ray.get_collider() is StaticBody2D: wall = true
	else: wall = false
	
	if floor_ray.is_colliding() == false: floor_ = true
	else: floor_ = false
	
	
	if wall:
		wall_dect.emit()
		wall = false
	if floor_:
		floor_dect.emit()
		floor_ = false
