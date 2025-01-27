class_name Player extends RigidBody2D
signal death
signal speed_changed(new_value:float)


@export var jump_force : float = 200
@export var friction : float = 200

@export var camera_frame : RigidBody2D
@export var charge := +30.0
@export var speed := 100.0


var active := true


func _ready() -> void:

	camera_frame.speed = speed
	speed_changed.emit(speed)


func _physics_process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed(&"jump"):
			charge *= - 1
			modulate = Color((charge > 0),0,(charge < 0))
		
		move_and_collide(Vector2.RIGHT * abs(speed) * delta)
	


func _on_death_detection_area_entered(area: Area2D) -> void:
	active = false
	death.emit()


func charge_up(value:float) -> void:
	charge += value
	speed += abs(value)
	camera_frame.speed = speed
	speed_changed.emit(speed)
