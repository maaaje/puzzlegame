extends Area2D

var active = false

func _ready():
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("box"):
		active = true
		print("Box entered!")


func _on_Area2D_area_exited(area):
	if area.is_in_group("box"):
		active = false
		print("Box left!")
