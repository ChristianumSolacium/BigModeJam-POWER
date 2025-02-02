extends Control

var is_play_pressed = false

func _ready() -> void:
	$PolarityLoopMenu.play()
	$CanvasLayer/MarginContainer/AnimatedSprite2D.play("titolo")
	
	var CONFIG_PATH := "user://config4.tres"
	
	var config := load(CONFIG_PATH)
	config = ConfigResource.new()
	config.current_level = 0
	ResourceSaver.save(config,CONFIG_PATH)

func _on_play_pressed() -> void:
	is_play_pressed = true
	$PolaritySdPress.play()
	$Tutorial.show()
	$CanvasLayer.hide()
	if Input.is_action_just_pressed(&"jump"):
		get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")
	
func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _process(delta: float) -> void:
	if is_play_pressed:
		if Input.is_action_just_pressed(&"jump"):
			get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")
	
