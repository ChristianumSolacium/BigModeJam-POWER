class_name PickUpMoveForward extends Area2D

@export var speed_bonus : float = 200
@export var sprite : Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.receive_input:
			if sprite.visible:
				sprite.hide()
			else:
				return
		
		body.speed_bonus += speed_bonus
		await get_tree().create_timer(1.0).timeout
		body.speed_bonus -= speed_bonus
