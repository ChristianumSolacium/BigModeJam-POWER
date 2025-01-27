extends CanvasLayer
@export var death_label : Label
@export var charge_bar : Range
@export var speed_label : Label
func game_over() -> void:
	death_label.show()


func _on_player_death() -> void: #TEMP
	game_over()


func _on_player_speed_changed(new_value: float) -> void:
	charge_bar.value = new_value
	speed_label.text = str(new_value)
