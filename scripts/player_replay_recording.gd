class_name PlayerReplayRecorder extends Node

@export var player : Player
@export var main : Node2D
const SAVE_PATH : = "saves/"

var start_time: float
var replay : PlayerReplayResource

func _ready() -> void:
	replay = PlayerReplayResource.new()
	await player.ready
	start_time = Time.get_unix_time_from_system()
	player.polarity_changed.connect(add_move)
	player.victory.connect(save_replay)
	
	

func add_move() -> void:
	var i = len(replay.timestamp)
	replay.timestamp.append(Time.get_unix_time_from_system() - start_time)


func save_replay() -> void:
	var dir = DirAccess.open("user://")
	if dir:
		if not dir.dir_exists(SAVE_PATH):
			dir.make_dir(SAVE_PATH)
	#ResourceSaver.save(replay,"user://" + SAVE_PATH + "replay "+ main.obstacles.name  +str(Time.get_unix_time_from_system()) +".tres")
