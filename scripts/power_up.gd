class_name PickUpPowerUp extends Area2D

@export var power_bonus : float = 200
@export var sprite : Sprite2D

func _ready() -> void:
	if not Engine.is_editor_hint():
		body_entered.connect(_on_body_entered)
	
	collision_mask = 32
	var ch := CompHint.new()
	add_child(ch)
	var ch_sprite := Sprite2D.new()
	ch_sprite.texture = sprite.texture
	ch.add_child(ch_sprite)
	ch_sprite.scale = sprite.scale * 0.6


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.receive_input:
			if sprite.visible:
				sprite.hide()
			else:
				return
		if body.speed + power_bonus < 300:
			body.speed = 300
			body.camera_frame.speed = 300
			return
		body.speed += power_bonus
		body.camera_frame.speed += power_bonus
		
