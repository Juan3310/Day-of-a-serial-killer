extends Area2D

signal got_shot()

func _on_bullet_entered(area: Area2D) -> void:
	got_shot.emit()
	area.queue_free()
	queue_free()
