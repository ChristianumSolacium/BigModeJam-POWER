class_name PickUpPhantomMode extends Area2D

@export var duration : float = 5
@export var sprite : Sprite2D

var meta_name := &"phantom_mode_count"
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.receive_input:
			if sprite.visible:
				sprite.hide()
			else:
				return
		
		if body.collision_mask % 2:
			body.collision_mask -= 1
			body.modulate.a = 0.6
			if not body.has_meta(meta_name): #crea una variabile senza doverla aggiungere al codice
				body.set_meta(meta_name,1)
		if body.has_meta(meta_name) and body.get_meta(meta_name) > 0:
			await get_tree().create_timer(duration).timeout
			
			if body.get_meta(meta_name) > 1:
				body.set_meta(meta_name, body.get_meta(meta_name) - 1)
			else:
				body.set_meta(meta_name, body.get_meta(meta_name) - 1)
				body.collision_mask += 1
				body.modulate.a = 1
		
		
