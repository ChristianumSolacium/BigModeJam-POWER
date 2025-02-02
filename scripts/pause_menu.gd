extends Control
signal skip_level

func _on_resume_pressed() -> void:
	get_tree().paused = false
	$".".hide()
	
func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	skip_level.emit()
