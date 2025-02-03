extends Node

@export var player: Player
@onready var polarity_sd_death: AudioStreamPlayer = $PolaritySdDeath
@onready var polarity_sd_pick_up: AudioStreamPlayer = $PolaritySdPickUp
@onready var polarity_sd_press: AudioStreamPlayer = $"PolaritySdPolarità"
@onready var polarity_sd_boost: AudioStreamPlayer = $PolaritySdBoost

@onready var polarity_loop_game: AudioStreamPlayer = $PolarityLoopGame
@onready var polarity_loop_menu: AudioStreamPlayer = $PolarityLoopMenu
@onready var polarity_loop_game_over: AudioStreamPlayer = $PolarityLoopGameOver

@onready var polarity_sd_victory: AudioStreamPlayer = $PolaritySdVictory

@onready var press_pitch := polarity_sd_press.pitch_scale


func set_volume(value:int,music:int) -> void:
	polarity_sd_boost.volume_db = value
	polarity_sd_press.volume_db = value + 3
	polarity_sd_death.volume_db = value
	polarity_sd_pick_up.volume_db = value
	polarity_sd_victory.volume_db = value
	
	polarity_loop_game.volume_db = music
	polarity_loop_menu.volume_db = music
	polarity_loop_game_over.volume_db = music


	
func _ready() -> void:
	set_volume(-16,-16)

func _on_player_gained_coin() -> void:
	polarity_sd_pick_up.play()


func _on_player_polarity_changed() -> void:
	polarity_sd_press.pitch_scale = press_pitch + randf_range(-0.5,0.5 )
	polarity_sd_press.play()
	


func _on_player_death() -> void:
	polarity_sd_death.play()
	polarity_loop_game.stop()
	polarity_loop_game_over.play()


func _on_main_start() -> void:
	var config : ConfigResource= load("user://config.tres")
	
	polarity_loop_menu.stop()
	polarity_loop_game.play(config.main_loop_position)


func _on_main_pause() -> void:
	var config : ConfigResource= load("user://config.tres")
	config.main_loop_position = polarity_loop_game.get_playback_position()
	ResourceSaver.save(config,"user://config.tres")
	polarity_loop_game.stop()
	polarity_loop_menu.play()

func _process(delta: float) -> void:
	if player.is_speeded and not polarity_sd_boost.playing:
		polarity_sd_boost.play()
	elif not player.is_speeded and polarity_sd_boost.playing:
		polarity_sd_boost.stop()


func _on_player_victory() -> void:
	polarity_sd_victory.play()
