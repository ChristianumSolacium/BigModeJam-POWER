class_name SpeedUp extends Area2D

@export var speed_up_per_100_unit :float= 6

func _ready() -> void:
	collision_mask = 32


func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		if body is Player:
			body.charge_up(delta * body.speed * speed_up_per_100_unit / 100)