class_name CameraFrame extends RigidBody2D



var speed := 1.0

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT * speed * delta)
