class_name SpeedUp extends Area2D

@export var speed := 1500.0

func _ready() -> void:
	collision_mask = 32
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

var initial_speed : Dictionary = {}

func _on_body_entered(body) -> void:
	if body is Player:
		print(body,initial_speed)
		initial_speed[body] = body.speed
		body.speed = speed
		body.camera_frame.speed = speed
		body.is_speeded = true
		
func _on_body_exited(body) -> void:
	if body is Player:
		body.speed = initial_speed[body]
		body.camera_frame.speed = initial_speed[body]
		body.is_speeded = false
		
