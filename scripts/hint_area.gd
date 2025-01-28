extends Area2D


@onready var hint_line: Node2D = $HintLine
@onready var player: Player = $"../../Player"

var dict : Dictionary

func _on_area_entered(area: Area2D) -> void:
	assert (area is CompHint,"il layer di collisione 5 va usato solo per oggetti CompHint")
	var sprite := Sprite2D.new()
	add_child(sprite)
	sprite.texture = area.texture
	sprite.global_position.x = hint_line.global_position.x
	sprite.global_position.y = area.global_position.y
	
	print(player.global_position,"!",sprite.global_position)
	
	dict[area] = sprite





func _on_area_exited(area: Area2D) -> void:
	if area in dict:
		remove_child(dict[area])
		dict.erase(area)
