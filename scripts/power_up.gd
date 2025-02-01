class_name PickUpPowerUp extends Area2D

@export var power_bonus : float = 200
@export var sprite : Sprite2D

var already_boosted_players: Array[Player] = [] #FORGIVE ME FATHER, but i am in a hurry

func _ready() -> void:
	if not Engine.is_editor_hint():
		body_entered.connect(_on_body_entered)
	
	var ch := CompHint.new()
	add_child(ch)
	var ch_sprite := Sprite2D.new()
	ch_sprite.texture = sprite.texture
	ch.add_child(ch_sprite)
	ch_sprite.scale = sprite.scale * 0.6


func _on_body_entered(body: Node2D) -> void:
	if body is Player and not body in already_boosted_players:
		if body.receive_input:
			if sprite.visible:
				sprite.hide()
			else:
				return
		already_boosted_players.append(body)
		body.charge_up(power_bonus)
		
