class_name VictoryArea extends Area2D


func _ready() -> void:
	collision_mask = 32
	body_entered.connect(_on_body_entered)

func _on_body_entered(body) -> void:
	print("!")
	if body is Player:
		body.victory.emit()
		body.receive_input = false
