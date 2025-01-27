extends RigidBody2D


var speed := 0.0

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT * speed * delta)
