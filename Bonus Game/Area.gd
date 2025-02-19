extends Area

signal collected

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("collected")
		queue_free()  # Го уништува предметот по собирање
