extends Timer

var timeLeft = 60

func _ready():
	$Timer.start()

func _process(delta):
	timeLeft -= delta
	if timeLeft <= 0:
		game_over()

func game_over():
	$CanvasLayer/Control.visible = true  # Прикажи го екранот за пораз
