@tool
class_name UtilityDrawInfiniteLine extends Node2D

var center: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.RIGHT  
@export var length: float = 100000.0  

func _draw():
	var start_pos = center - direction.normalized() * length / 2
	var end_pos = center + direction.normalized() * length / 2
	draw_line(start_pos, end_pos, Color.RED, 2)

func _process(delta):
	queue_redraw() 


func _ready() -> void:
	if not Engine.is_editor_hint():
		queue_free()
	z_index = -500
