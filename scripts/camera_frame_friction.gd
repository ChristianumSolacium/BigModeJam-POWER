extends Area2D

@onready var parent : CameraFrame = get_parent()
func _physics_process(delta: float) -> void:
	
	if parent.player in get_overlapping_bodies() and parent.player.speed > 300:
		parent.player.charge_up(-10 * delta)
