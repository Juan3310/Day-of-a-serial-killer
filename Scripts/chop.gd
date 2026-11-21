extends Sprite2D

var timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $ChoppingTime
	visible = false
	
func _process(delta: float) -> void:
	if timer.time_left == 0:
		visible = false

func _on_killer_karate_chop() -> void:
	visible = true
	timer.start()
	if timer.time_left == 0:
		visible = false
	
