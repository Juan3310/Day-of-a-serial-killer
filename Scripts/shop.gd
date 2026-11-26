extends Area2D

var player_in_range : bool

var RNG : RandomNumberGenerator
var buttonL 
var buttonR
var buttonM
var buttonList = []

func _ready() -> void:
	RNG = RandomNumberGenerator.new()
	RNG.randomize()
	
	buttonL = $ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy
	buttonM = $ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy3
	buttonR = $ShopUI/Panel/VBoxContainer/HBoxContainer/SmokeBuy2
	
	buttonList = [buttonL, buttonM, buttonR]
	
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


func _on_gameplay_tree_new_time(time: String) -> void:
	for i in range(0, len($ShopUI/Panel/VBoxContainer/HBoxContainer.get_children())):
		buttonList[i].text = pick_three_items(RNG, time)[i]
		print(buttonList[i].text)
	
	
func pick_three_items(rng : RandomNumberGenerator, time_of_day : String):
	var dayItemsList := ["watch", 
	"apple", 
	"jump drink", 
	"gasoline"]
	var nightItemsList := ["bullet", "smoke bomb", "silencer"]
	
	var index := 0
	
	var item1 : String
	var item2 : String
	var item3 : String
	var shopList = [item1, item2, item3]
	
	for i in range(0, len(shopList)):
		rng.randomize()
		if time_of_day == "day":
			index = rng.randi_range(0, len(dayItemsList) - 1)
			shopList[i] = dayItemsList[index]
		else:
			index = rng.randi_range(0, len(nightItemsList) - 1)
			shopList[i] = nightItemsList[index]
	return shopList
	
	
