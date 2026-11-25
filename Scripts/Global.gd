extends Node

var DayTime : int #0 is day, 1 is night
var Noons : int #Counts every switch between time and night, therefore odds are nights, and evens are days
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DayTime = 1
	Noons = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if DayTime == 0:
		RenderingServer.global_shader_parameter_set("inversion", false)
	elif DayTime == 1:
		RenderingServer.global_shader_parameter_set("inversion", true)
	else:
		print(false)
		DayTime = 0
