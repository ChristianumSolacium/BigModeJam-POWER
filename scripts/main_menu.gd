extends Control

func _ready() -> void:
	$PolarityLoopMenu.play()
	$CanvasLayer/MarginContainer/AnimatedSprite2D.play("titolo")
	
	var CONFIG_PATH := "user://config4.tres"
	
	var config := load(CONFIG_PATH)
	config = ConfigResource.new()
	config.current_level = 0
	ResourceSaver.save(config,CONFIG_PATH)

func _on_play_pressed() -> void:
	$PolaritySdPress.play()
	get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")
	

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
