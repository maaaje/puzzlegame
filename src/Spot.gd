extends Area2D

var active = false

func _ready():
	pass # Replace with function body.

func _on_Spot_body_entered(body):
	if body.is_in_group("box"):
		body.glow = true
		active = true
		# play sound

func _on_Spot_body_exited(body):
	if body.is_in_group("box"):
		body.glow = false
		active = false
		# play sound
