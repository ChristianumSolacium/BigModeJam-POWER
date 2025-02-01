class_name Player extends RigidBody2D
signal death
signal speed_changed(new_value:float)
signal polarity_changed
signal gained_coin
signal victory


@export var camera_frame : CameraFrame
@export var charge := +30.0
@export var speed := 100.0:
	set(value):
		if speed > 1500 and value < speed:
			speed = 1500 - (speed - value)
		else:
			speed = value
		
		if value > 1500 and not is_speeded:
			is_speeded = true
		speed_changed.emit(speed)

var speed_bonus := 0.0
## regola come cambia la velocità del giocatore stando in un campo elettrico
@export var speed_change := 10.0

@export var charge_multiplier := 1.0

@export var receive_input := true
@export_category("Resources ")
@export var positive_texture : Texture
@export var negative_texture : Texture
@export var speeded_positive_texture : Texture
@export var speeded_negative_texture : Texture


@export var is_speeded := false

@onready var sprite: Sprite2D = $Sprite
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var active := true

func _ready() -> void:
	
	contact_monitor = true
	max_contacts_reported = 2
	camera_frame.speed = speed
	speed_changed.emit(speed)


func _physics_process(delta: float) -> void:
	if active:
		if receive_input and Input.is_action_just_pressed(&"jump"):
			switch_polarity()
		
		sprite.texture = get_current_texture()

		move_and_collide(Vector2.RIGHT * (speed + speed_bonus) * delta)

func switch_polarity() -> void:
	charge *= - 1
	sprite.texture = get_current_texture()
	polarity_changed.emit()


func get_current_texture() -> Texture:
	if is_speeded:
		animated_sprite_2d.show()
		animated_sprite_2d.play("speed_up_tail")
		return speeded_positive_texture if charge > 0 else speeded_negative_texture
	else:
		animated_sprite_2d.hide()
		return positive_texture if charge > 0 else negative_texture


func _on_death_detection_area_entered(area: Area2D) -> void:
	if area == camera_frame.death:
		die()
	
	#get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func die():
	active = false
	death.emit()

	sprite.hide()
	animated_sprite_2d.play("morte")



func charge_up(value:float) -> void:
	if not active:
		return
	speed += speed_change * value
	camera_frame.speed = speed


func _on_victory() -> void:
	speed_bonus = 800


func speed_up():
	if is_speeded:
		is_speeded = false
	else:
		is_speeded = true
