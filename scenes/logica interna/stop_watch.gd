extends Label

#TODO abbellire tutto - sto morendo di stanchezza XD
var time_elapsed := 0.0
var is_stopped := false

func _process(delta: float) -> void:
	if !is_stopped:
		time_elapsed += delta
		$'.'.text = str(time_elapsed).pad_decimals(2)

func reset() -> void:
	#TODO salvare il record prima di resettarlo
	time_elapsed = 0.0
	is_stopped = false

func stop() -> void:
	is_stopped = true
