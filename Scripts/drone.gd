extends Area2D

var speed := 100.0
var direction : Vector2

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2(scale.x, 0)
	position += direction * speed * delta


func _on_wall_dect() -> void:
	scale.x *= -1
