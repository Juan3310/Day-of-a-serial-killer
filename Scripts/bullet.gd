extends Area2D

var direction : Vector2
var player_position : Vector2
var speed := 125
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = player_position
	rotation = direction.angle()
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
