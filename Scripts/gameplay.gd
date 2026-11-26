extends Node2D

var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")

var target_checklisted : bool

var DayTimer : Timer

signal newTime(time : String)
var Noon

func _ready() -> void:
	DayTimer = $DayTimer
	
	target_checklisted = false
	$NightShop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.bought.connect(on_buy)
	$NightShop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.stole.connect(on_steal)
	$DayShop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.bought.connect(on_buy)
	$DayShop/ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy.stole.connect(on_steal)
	
	newTime.emit("day")

func _process(_delta: float) -> void:
	if Global.DayTime == 0:
		$NightShop.set_process(false)
		$DayShop.set_process(true)
	elif Global.DayTime == 1:
		$NightShop.set_process(true)
		$DayShop.set_process(false)
	if DayTimer.time_left == 0.0:
		if Global.Noons % 2 == 0:
			Noon = "night"
		else:
			Noon = "day"
		newTime.emit(Noon)

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
