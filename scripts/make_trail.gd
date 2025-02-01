extends Node2D


@export var distance := 70.0
@export var scale_factor := 0.5
@export_category("Pallini")
@export_range(0,1) var alpha_channel : float = 1
@onready var last_pos := global_position.x
@export_category("Nodes")
@export var player: Player
var sprite_pool : Array[Sprite2D]
const  sprite_pool_size := 30


func _ready() -> void:
	sprite_pool.resize(sprite_pool_size)
	
	await player.get_parent().ready
	for i in range(sprite_pool_size):
		sprite_pool[i] = Sprite2D.new()
		sprite_pool[i].modulate.a = alpha_channel
		sprite_pool[i].scale *= scale_factor * player.sprite.scale.x #aggiungo scale del player perchè si adatti alla misura del player
		sprite_pool[i].global_position = Vector2(0,-2000)
		sprite_pool[i].z_index = 100
		player.get_parent().add_child(sprite_pool[i])

var current_index := 0

func _process(delta: float) -> void:
	if global_position.x > last_pos + distance:
		sprite_pool[current_index].texture = player.get_current_texture()
		sprite_pool[current_index].global_position = global_position
		
		current_index = (current_index + 1) % sprite_pool_size
		last_pos = global_position.x
		
