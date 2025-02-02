extends CanvasLayer

@onready var victory_animation: AnimatedSprite2D = $VictoryMenu/VictoryAnimations
@onready var sparkle_animation: AnimatedSprite2D = $VictoryMenu/SparkleAnimations


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sparkle_animation.play("sparkle")
	victory_animation.play("victory_logo")
