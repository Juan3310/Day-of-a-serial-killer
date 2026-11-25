extends Area2D

var player_in_range : bool

var RNG : RandomNumberGenerator

func _ready() -> void:	
	$ShopUI.visible = false

func _process(_delta: float) -> void:
	if player_in_range:
		$ShopUI.visible = true
	else:
		$ShopUI.visible = false


func _on_body_entered(_body: CharacterBody2D) -> void:
	player_in_range = true


func _on_body_exited(_body: CharacterBody2D) -> void:
	player_in_range = false
