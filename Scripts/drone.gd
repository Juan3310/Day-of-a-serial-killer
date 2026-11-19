extends Area2D

var speed := 100.0
var direction : Vector2

var player_ : CharacterBody2D
var player_detected : bool

func _ready() -> void:
	player_detected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not player_detected:
		direction = Vector2(scale.x, 0).normalized()
		position += direction * speed * delta
	else:
		position.x = move_toward(global_position.x,
		 player_.global_position.x, speed * delta)
		
		direction = Vector2(player_.position - position).normalized()
		if !(direction.x < 1 and direction.x > -1):
			scale.x = direction.x

func _on_wall_dect() -> void:
		scale.x *= -1

func _on_player_detected(player) -> void:
	player_ = player
	player_detected = true


func _on_player_lost() -> void:
	player_detected = false
	
