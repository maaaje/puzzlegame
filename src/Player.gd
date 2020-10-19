extends Node2D

var tile_size = 16
var inputs = {"up": Vector2.UP,
			"down": Vector2.DOWN,
			"left": Vector2.LEFT,
			"right": Vector2.RIGHT}

onready var ray = $KinematicBody2D/RayCast2D
onready var anim = $KinematicBody2D/AnimationPlayer
onready var tween = $KinematicBody2D/Tween
var speed = 10

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	
func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
				move(dir)
			
func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
	#	position += inputs[dir] * tile_size
		move_tween(dir)
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("box"):
			if collider.move(dir):
				move_tween(dir)
		
func move_tween(dir):
	anim.play("walk")
	tween.interpolate_property(self, "position", position, 
		position + inputs[dir] * tile_size, 1.0/speed, Tween.TRANS_SINE, 
		Tween.EASE_IN_OUT)
	tween.start()
