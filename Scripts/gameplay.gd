extends Node2D

var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")

var target_checklisted : bool

func _ready() -> void:
	target_checklisted = false



func _process(_delta: float) -> void:
	pass


func _poster_inspected() -> void:
	if not target_checklisted:
		target_checklisted = true
	else:
		print("checklisted already")
		
func on_shoot_emit(direction, killer_position):
	var bullet = bullet_scene.instantiate()
	
	bullet.player_position = killer_position
	bullet.direction = direction
	$".".add_child(bullet)


func _on_target_got_shot() -> void:
	if target_checklisted:
		print("killed the target")
	else:
		print("killed, but wasn't target")
