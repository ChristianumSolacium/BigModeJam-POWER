@tool
class_name UtilityFixCollisionShape2D extends Node

var fix_rate : Timer

func _ready() -> void:
	fix_rate = Timer.new()
	fix_rate.wait_time = 5
	add_child(fix_rate)
	fix_rate.timeout.connect(fix)
	fix_rate.start()


func fix() -> void:
	for node:Node in get_all_children_of(get_parent()):
		if node is CollisionShape2D:
			node.scale *= node.get_parent().scale
			node.get_parent().scale = Vector2.ONE


func get_all_children_of(node:Node) -> Array[Node]:
	var arr : Array[Node] = []
	for child in node.get_children():
		arr += get_all_children_of(child)
	
	return arr
