extends CanvasLayer
@export var game_over_popup : TextureRect
@export var victory_popup : TextureRect
@export var charge_bar : Range
@export var speed_label : Label
@export var coin_labels : Label
@export var stop_watch : Label
@onready var timer: Timer = $Timer

const GAME_OVER_FRAME_0 = preload("res://sprites/GUI/Game Over_frame0.png")
const GAME_OVER_FRAME_1 = preload("res://sprites/GUI/Game Over_frame1.png")

func game_over() -> void:
	game_over_popup.show()

func victory() -> void:
	victory_popup.show()

func _on_player_death() -> void: #TEMP
	game_over()
	$StopWatch.stop()

func _on_player_speed_changed(new_value: float) -> void:
	charge_bar.value = new_value
	speed_label.text = "%.3f%%" % ((new_value - 300) /1200  * 100)


func _on_timer_timeout() -> void:
	if game_over_popup.texture == GAME_OVER_FRAME_0:
		game_over_popup.texture = GAME_OVER_FRAME_1
	else:
		game_over_popup.texture = GAME_OVER_FRAME_0

var coins := 0

func update_coins() -> void:
	coins += 1
	coin_labels.text = str(coins)


func _on_player_victory() -> void:
	victory()
	$StopWatch.stop()
