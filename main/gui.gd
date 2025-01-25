extends CanvasLayer
@export var death_label : Label

func game_over() -> void:
	death_label.show()


func _on_player_death() -> void: #TEMP
	game_over()
