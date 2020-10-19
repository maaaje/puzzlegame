extends Area2D

var active = false

func _ready():
	pass # Replace with function body.

func _on_Spot_body_entered(body):
	if body.is_in_group("box"):
		active = true
		print("Box entered!")


func _on_Spot_body_exited(body):
	if body.is_in_group("box"):
		active = false
		print("Box left!")
