extends Control

func _ready() -> void:
	$PolarityLoopMenu.play()
	$CanvasLayer/MarginContainer/AnimatedSprite2D.play("titolo")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")
	$PolaritySdPress.play()

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
