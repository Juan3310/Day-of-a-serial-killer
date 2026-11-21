extends Area2D

var direction : Vector2
var shoot_position : Vector2
var speed := 1100.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = shoot_position
	rotation = direction.angle()
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is StaticBody2D:
		queue_free()
