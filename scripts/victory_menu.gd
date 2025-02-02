extends Control
signal continue_next_level
signal restart
@onready var score_label: Label = $ScoreLabel

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_replay_button_pressed() -> void:
	#TODO Aggiungere funzione replay
	pass # Replace with function body.
	
func _on_continue_button_pressed() -> void:
	continue_next_level.emit()


func _on_restart_button_pressed() -> void:
	restart.emit()

func set_score(value:int) -> void:
	score_label.text = "SCORE: " + str(value)
