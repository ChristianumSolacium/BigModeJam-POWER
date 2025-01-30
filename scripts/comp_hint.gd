@tool
class_name CompHint
extends Area2D


func _ready() -> void:
	
	
	#region verifica della presenza di uno Sprite tra i figli che verrà usato come icona
	var has_sprite_child := false
	var has_collision_shape := false
	for child in get_children():
		if child is Sprite2D:
			has_sprite_child = true
		elif child is CollisionShape2D:
			has_collision_shape = true
	assert(has_sprite_child,"I nodi CompHint devono avere come figlio uno Sprite2D")
	#endregion
	
	if not has_collision_shape:
		var collision_shape := CollisionShape2D.new()
		collision_shape.shape = RectangleShape2D.new()
		collision_shape.shape.size = Vector2(30,30)
		add_child(collision_shape)
	collision_layer = 16
	
