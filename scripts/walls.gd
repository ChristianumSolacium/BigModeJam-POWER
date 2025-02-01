class_name CameraFrame extends RigidBody2D

@export var player: Player
@onready var death: Area2D = $Death

var speed := 1.0
var active := true
func _physics_process(delta: float) -> void:
	if active:
		move_and_collide(Vector2.RIGHT * speed * delta)
