extends CanvasLayer

signal scene_changed()

onready var anim = $AnimationPlayer
onready var black = $Control/Black

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	anim.play("fade")
	yield(anim, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	anim.player_backwards("fade")
	yield(anim, "animation_finished")
	emit_signal("scene_changed")
