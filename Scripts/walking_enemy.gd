extends CharacterBody2D

@onready
#var patrol_direction : Vector2 
var direction : Vector2

var speed := 100.0

var dist_to_player : Vector2

var player_detected := false

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not player_detected:
		direction = Vector2($Node2D.scale.x, 0)
		speed = 150.0
	else:
		direction = dist_to_player
		$Node2D.scale.x = direction.x
		speed = 250.0
	velocity.x = direction.x * speed
	velocity += get_gravity() * delta
	move_and_slide()
	

func _on_floor_dect() -> void:
	if not player_detected:
		$Node2D.scale.x *= -1


func _on_wall_dect() -> void:
	if not player_detected:
		$Node2D.scale.x *= -1

func _on_player_detected(distance: Vector2) -> void:
	player_detected = true
	dist_to_player = Vector2(distance.x, 0).normalized()
	


func _on_player_lost() -> void:
	player_detected = false
