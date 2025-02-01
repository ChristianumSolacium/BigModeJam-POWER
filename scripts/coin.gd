class_name PickUpCoin extends Area2D

@export var sprite : Sprite2D

func _ready():
	collision_mask = 32
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	print("!")
	if body is Player:
		if body.receive_input:
			if sprite.visible:
				sprite.hide()
			else:
				return
		
		body.gained_coin.emit()
