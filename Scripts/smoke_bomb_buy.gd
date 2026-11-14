extends Button


signal bought(item : String)

signal stole(item : String)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:

		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:

			bought.emit("smoke")

		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:

			stole.emit("smoke")
