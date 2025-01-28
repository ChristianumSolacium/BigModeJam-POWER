class_name CompDestroyOnImpact extends Node
## TODO attualmente non funziona
var parent : Node2D
func _ready() -> void:
	parent = get_parent()
	assert(parent is RigidBody2D)
	
	parent.contact_monitor = true
	parent.max_contacts_reported = 2
	
	await parent.tree_entered
	parent.body_entered.connect(a)

func a(a):
	print("!")
	parent.queue_free()
