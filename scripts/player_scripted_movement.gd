class_name PlayerAutoMovement extends Node


@export var replay : PlayerReplayResource
@export var player : Player
var index := 0
var timer : Timer
var last_time := 0.0
 
func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	await player.ready
	timer.timeout.connect(set_new_timer)
	timer.start(replay.timestamp[index] - last_time)
	index += 1
	

func set_new_timer() -> void:
	if index >= len(replay.timestamp):
		return
	timer.start(replay.timestamp[index] - last_time)
	last_time = replay.timestamp[index]
	index += 1
	
	player.switch_polarity()
	
