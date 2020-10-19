extends KinematicBody2D

var tile_size = 16
var inputs = {"up": Vector2.UP,
			"down": Vector2.DOWN,
			"left": Vector2.LEFT,
			"right": Vector2.RIGHT}

var glow = false setget set_glow

onready var ray = $RayCast2D
onready var sprite = $Sprite
onready var glow_mat = preload("res://src/glow_sprite_material.tres")
onready var green_box = preload("res://assets/Tilesheet/box_green.png")
		
func set_glow(glow):
	if glow:
		sprite.set_material(glow_mat)
	else:
		sprite.set_material(null)
	
func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size
		return true
	return false
