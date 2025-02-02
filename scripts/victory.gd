extends CanvasLayer

@onready var victory_animation: AnimatedSprite2D = $VictoryMenu/VictoryAnimations
@onready var sparkle_animation: AnimatedSprite2D = $VictoryMenu/SparkleAnimations
@onready var button1_animation: AnimatedSprite2D = $VictoryMenu/Button1Animations
@onready var button2_animation: AnimatedSprite2D = $VictoryMenu/Button2Animations
@onready var button3_animation: AnimatedSprite2D = $VictoryMenu/Button3Animations
@onready var button4_animation: AnimatedSprite2D = $VictoryMenu/Button4Animations

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sparkle_animation.play("sparkle")
	victory_animation.play("victory_logo")
