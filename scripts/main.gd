extends Node2D
signal start
signal pause

@onready var pause_menu = $Graphics/Pause/PauseMenu

var obstacles: Node2D 
@export var levels :Array[PackedScene]

@export var player : Player
var CONFIG_PATH := "user://config4.tres"
const THANKYOU = preload("res://scenes/logica interna/thankyou.tscn")
@export var test_mode := false
func _ready() -> void:
	start.emit()
	if not (OS.has_feature("editor") and test_mode):
		var config : ConfigResource = load(CONFIG_PATH)
		load_current_level()
		
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and not $Graphics/GUI.game_over_popup.visible:
		toggle_pause()
	if event.is_action_pressed("Fast Restart"):
		restart()


func restart() -> void:
	get_tree().change_scene_to_file("res://scenes/logica interna/main.tscn")


func toggle_pause():
	if pause_menu.visible:
		pause_menu.hide()
		get_tree().paused = false
		start.emit()
	else:
		pause_menu.show()
		get_tree().paused = true
		pause.emit()

func _on_player_death() -> void:
	obstacles.hide()


func load_level(level_scene: PackedScene) -> void:
	if obstacles != null:
		remove_child(obstacles)
	
	obstacles = level_scene.instantiate()
	add_child(obstacles)

	
	for child in obstacles.get_children():
		if child is UtilityChangeStats:
			player.speed = child.player_initial_speed
			player.camera_frame.speed = child.player_initial_speed
	
	obstacles.global_position = Vector2.ZERO


func load_current_level() -> void:
	var config : ConfigResource = load(CONFIG_PATH)
	load_level(levels[config.current_level])
	


func load_next_level() -> void:
	var config : ConfigResource = load(CONFIG_PATH)
	config.current_level += 1
	if config.current_level < len(levels):
		ResourceSaver.save(config,CONFIG_PATH)
		load_level(levels[config.current_level])
	else:
		add_child(THANKYOU.instantiate())
		


func _on_victory_menu_continue_next_level() -> void:
	load_next_level()
	restart()





func _on_victory_menu_restart() -> void:
	restart()


func _on_pause_menu_skip_level() -> void:
	toggle_pause()
	load_next_level()
	restart()


func _on_pause_menu_update_sound_volume() -> void:
	pass # Replace with function body.
