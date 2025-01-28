class_name Player extends RigidBody2D
signal death
signal speed_changed(new_value:float)

@export var camera_frame : RigidBody2D
@export var charge := +30.0
@export var speed := 100.0

## regola come cambia la velocità del giocatore stando in un campo elettrico
@export var speed_change := 10.0
## regola come cambia la carica del giocatore stando in un campo elettrico
@export var charge_change := 1.0

@export_category("Resources ")
@export var positive_texture : Texture
@export var negative_texture : Texture
@onready var sprite: Sprite2D = $Sprite


var active := true


func _ready() -> void:
	
	contact_monitor = true
	max_contacts_reported = 2
	camera_frame.speed = speed
	speed_changed.emit(speed)


func _physics_process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed(&"jump"):
			charge *= - 1
			
			if charge > 0:
				sprite.texture = positive_texture
			else:
				sprite.texture = negative_texture
		
		move_and_collide(Vector2.RIGHT * abs(speed) * delta)
		
	


func _on_death_detection_area_entered(area: Area2D) -> void:
	active = false
	death.emit()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func charge_up(value:float) -> void:
	charge += charge_change *  value
	speed += speed_change * abs( value)
	camera_frame.speed = speed
	speed_changed.emit(speed)
