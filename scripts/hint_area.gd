extends Area2D


@onready var hint_line: Node2D = $HintLine
@onready var player: Player = $"../../Player"

var dict : Dictionary

func _on_area_entered(area: Area2D) -> void:
	assert (area is CompHint,"il layer di collisione 5 va usato solo per oggetti CompHint")
	
	for child in area.get_children():
		if child is Sprite2D:
			area.remove_child(child)
			add_child(child)
			child.global_position.x = hint_line.global_position.x
			child.global_position.y = area.global_position.y
			
			print(player.global_position,"!",child.global_position)
			
			dict[area] = child





func _on_area_exited(area: Area2D) -> void:
	if area in dict:
		remove_child(dict[area])
		dict.erase(area)
