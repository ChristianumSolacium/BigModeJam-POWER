extends Label

var time_elapsed := 0.0
var is_stopped := false

func _process(delta: float) -> void:
	if !is_stopped:
		time_elapsed += delta * 1000
		$'.'.text = time_convert(time_elapsed)

func reset() -> void:
	#TODO per salvare il record prima di resettarlo
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
	
func time_convert(time_elapsed):
	var msec =  int(time_elapsed) % 1000
	var seconds = (int(time_elapsed)% 60000) / 1000
	# in case we need minutes
	#var minutes = (int(time_elapsed)/6000)
	
	return "%02d:%03d" % [seconds, msec]
