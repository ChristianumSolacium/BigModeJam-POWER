class_name CompRotate extends Node


@export var rotation_speed : float = 1.0

@onready var parent : Node2D = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent.rotate(delta * rotation_speed)
