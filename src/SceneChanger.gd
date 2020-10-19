extends CanvasLayer

signal scene_changed()

onready var anim = $AnimationPlayer
onready var black = $Control/Black
onready var game = get_node("/root/Game")

func change_scene(level_number : int, delay = 0.5):
	var next_level_path = "res://src/Level_" + str(level_number) + ".tscn"
	var next_level = load(next_level_path)

	yield(get_tree().create_timer(delay), "timeout")
	anim.play("fade")
	yield(anim, "animation_finished")
	
	var current_level = game.get_node("Level").get_child(0)
	game.get_node("Level").remove_child(current_level)
	game.get_node("Level").add_child(next_level.instance())
	
	#assert(get_tree().change_scene(path) == OK)
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	emit_signal("scene_changed")
