extends Area2D

var player_in_range : bool

signal inspect

func _process(_delta: float) -> void:
	if player_in_range:
		if Input.is_action_just_pressed("Action perform"):
			inspect.emit()


func _on_body_entered(_body: CharacterBody2D) -> void:
	player_in_range = true


func _on_body_exited(_body: CharacterBody2D) -> void:
	player_in_range = false
