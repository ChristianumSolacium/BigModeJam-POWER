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


func _ready() -> void:
	for child:AudioStreamPlayer in get_children():
		child.volume_db = -16
func _on_player_gained_coin() -> void:
	polarity_sd_pick_up.play()


func _on_player_polarity_changed() -> void:
	polarity_sd_press.pitch_scale = press_pitch + randf_range(-0.5,0.5 )
	polarity_sd_press.play()
	


func _on_player_death() -> void:
	polarity_sd_death.play()
	polarity_loop_game.stop()
	polarity_loop_game_over.play()

var current_current_game_loop_pos := 0.0
func _on_main_start() -> void:
	polarity_loop_menu.stop()
	polarity_loop_game.play(current_current_game_loop_pos)


func _on_main_pause() -> void:
	current_current_game_loop_pos = polarity_loop_game.get_playback_position()
	polarity_loop_game.stop()
	polarity_loop_menu.play()

func _process(delta: float) -> void:
	if player.is_speeded and not polarity_sd_boost.playing:
		polarity_sd_boost.play()
	elif not player.is_speeded and polarity_sd_boost.playing:
		polarity_sd_boost.stop()


func _on_player_victory() -> void:
	polarity_sd_victory.play()
