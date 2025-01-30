@tool
class_name CompElectricField extends Area2D

@export var force: float = 1000


## l'intensità del campo varia con 1 / (distanza ^ exponent)
@export var exponent: float = 0.1
@onready var parent : RigidBody2D = get_parent()

func _ready() -> void:
	
	collision_mask = 32 # Ha effetto solo sul giocatore
	
	#region rende gialli i campi elettrici per distinguerli dal resto
	if Engine.is_editor_hint():
		set_physics_process(false)
		for child in get_children():
			__debug_set_color(child)
		child_entered_tree.connect(__debug_set_color)
	
	
	

	
	#endregion
		

#TODO come rappresentare graficamente la direzione del campo? 
#campo di vettori?
func _physics_process(delta: float) -> void:
	
	for body: RigidBody2D in get_overlapping_bodies():
		
		if body is Player:
			print(collision_mask)
			print(body)
			var intensity : float= get_field_intensity_at(body.global_position) * body.speed/300
			
			body.apply_central_force(Vector2.UP * intensity * body.charge)
			body.charge_up(delta * intensity)
	
	


func get_field_intensity_at(pos:Vector2) -> float:
	return force / (((pos.y - parent.global_position.y))** exponent)


func __debug_set_color(child:Node2D):
	if child is CollisionShape2D:
		child.debug_color = Color(1,1,0,0.2)
		
