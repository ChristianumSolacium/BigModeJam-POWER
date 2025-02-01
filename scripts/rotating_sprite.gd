@tool
class_name CompRotate extends Node


@export var rotation_speed : float = 1.0

@onready var parent : Node2D = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.

var initial_rotation: float

func _ready() -> void:
	initial_rotation = parent.rotation

func _process(delta: float) -> void:
	parent.rotate(delta * rotation_speed)

func _exit_tree() -> void:
	parent.rotation = initial_rotation
