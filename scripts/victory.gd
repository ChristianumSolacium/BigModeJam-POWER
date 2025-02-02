extends CanvasLayer

@onready var victory_animation: AnimatedSprite2D = $VictoryMenu/VictoryAnimations
@onready var sparkle_animation: AnimatedSprite2D = $VictoryMenu/SparkleAnimations
@onready var button1_animation: AnimatedSprite2D = $VictoryMenu/Button1Animations
@onready var button2_animation: AnimatedSprite2D = $VictoryMenu/Button2Animations

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sparkle_animation.play("sparkle")
	victory_animation.play("victory_logo")
	button1_animation.play("buttons")
	button2_animation.play("buttons")
