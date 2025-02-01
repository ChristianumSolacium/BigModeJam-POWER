class_name SpeedUp extends Area2D

@export var speed := 1500.0

func _ready() -> void:
	collision_mask = 32

var initial_speed : Dictionary = {}

func _on_body_entered(body) -> void:
	if body is Player:
		initial_speed[body] = speed
		body.speed = speed
		body.camera_frame.speed = speed
		
func _on_body_exited(body) -> void:
	if body is Player:
		body.speed = initial_speed[body]
		body.camera_frame.speed = initial_speed[body]
