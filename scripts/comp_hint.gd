@tool
class_name CompHint
extends Area2D


func _ready() -> void:
	
	#region verifica della presenza di uno Sprite tra i figli che verrà usato come icona
	var has_sprite_child := false
	
	for child in get_children():
		if child is Sprite2D:
			has_sprite_child = true
	
	assert(has_sprite_child,"I nodi CompHint devono avere come figlio uno Sprite2D")
	#endregion
	
