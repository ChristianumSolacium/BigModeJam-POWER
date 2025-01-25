class_name Player extends RigidBody2D
signal death

@export var jump_force : float = 200
@export var backward_speed : float = 200

var active := true

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 2


func _physics_process(delta: float) -> void:
	if active:
		if Input.is_action_pressed(&"jump"):
			apply_central_force(jump_force * Vector2.UP)
	if get_contact_count(): #HACK come implementare il rallentamento dovuto al contatto con oggetti?
		apply_central_force(backward_speed * Vector2.LEFT)
	else:
		linear_velocity.x *= 0.5 ** delta #HACK
	$Icon.rotation += 0.7 * delta


func _on_death_detection_area_entered(area: Area2D) -> void:
	active = false
	death.emit()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
