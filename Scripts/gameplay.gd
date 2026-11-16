extends Node2D

var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")

var target_checklisted : bool

func _ready() -> void:
	target_checklisted = false
	$Shop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.bought.connect(on_buy)
	$Shop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.stole.connect(on_steal)


func _process(_delta: float) -> void:
	pass


func _poster_inspected() -> void:
	if not target_checklisted:
		target_checklisted = true
	else:
		print("checklisted already")
		
func on_shoot_emit(direction, shooter_postion):
	var bullet = bullet_scene.instantiate()
	
	bullet.shoot_position = shooter_postion
	bullet.direction = direction
	$".".add_child(bullet)


func _on_target_got_shot() -> void:
	if target_checklisted:
		print("killed the target")
	else:
		print("killed, but wasn't target")
		
func on_buy(item):
	if item == "smoke":
		print(item)
		
func on_steal(item):
	pass
