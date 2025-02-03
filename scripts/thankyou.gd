extends Control


@onready var timer: Timer = $Timer
@onready var space_to_continue: Label = $SpaceToContinue
@onready var quit: TextureButton = $Quit

var step := 0

@export var slides : Array[CanvasItem]

var enable_continue : bool = false

func _ready() -> void:
	$PolarityLoopMenu.play()
	timer.start()
	

func _on_timer_timeout() -> void:
	space_to_continue.show()
	enable_continue = true

func next_step() -> void:
	if step < len(slides) - 1:
		enable_continue = false
		space_to_continue.hide()
		slides[step].hide()
		step += 1
		slides[step].show()
		timer.start()
	else:
		slides[step].hide()
		quit.show()


func _process(delta: float) -> void:
	if enable_continue and Input.is_action_just_pressed(&"jump"):
		next_step()


func _on_quit_pressed() -> void:
	get_tree().quit()
