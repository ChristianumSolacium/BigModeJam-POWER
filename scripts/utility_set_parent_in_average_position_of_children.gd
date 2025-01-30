@tool
class_name UtilitySetParentInAveragePositionOfChildren
extends Node

func _ready() -> void:
	var parent = get_parent()
	var children = parent.get_children()
	
	if children.is_empty():
		return  # No children, nothing to do

	var center = Vector2.ZERO
	var count = 0

	for child in children:
		if child is Node2D:  # Only consider Node2D children
			center += child.position
			count += 1

	if count > 0:
		center /= count  # Average position
		for child in children:
			if child is Node2D:
				child.position -= center  # Offset children
		parent.position += center  # Move parent to the new center
	
	queue_free()
