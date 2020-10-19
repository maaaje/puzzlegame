extends KinematicBody2D

var tile_size = 16
var inputs = {"up": Vector2.UP,
			"down": Vector2.DOWN,
			"left": Vector2.LEFT,
			"right": Vector2.RIGHT}

onready var ray = $RayCast2D
		
func move(dir):
	print("move function box called")
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size
		return true
	return false
