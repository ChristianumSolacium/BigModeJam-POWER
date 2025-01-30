class_name InstaDeathObstacle extends Area2D


func _ready() -> void:
	collision_mask = 32
	body_entered.connect(kill)


func kill(body:RigidBody2D) -> void:
	if body is Player:
		body.die()
