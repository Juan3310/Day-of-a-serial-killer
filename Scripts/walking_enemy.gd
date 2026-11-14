extends CharacterBody2D

@onready
var direction := 1.0
var speed := 100.0


var player_detected := false

func _physics_process(delta: float) -> void:
	if not player_detected:
		patrol()
	move_and_slide()
	

func _on_floor_dect() -> void:
	direction *= -1
	scale.x *= -1


func _on_wall_dect() -> void:
	direction *= -1
	scale.x *= -1

func patrol():
	velocity.x = direction * speed
