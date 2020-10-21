extends Node2D

onready var spots_node = get_node("Level").get_child(0).get_node("Spots")
onready var current_level = get_node("Level").get_child(0)
onready var scene_changer = get_node("/root/SceneChanger")

var game_ended = false

func _ready():
	scene_changer.connect("scene_changed", self, "on_Scene_changed")

func _process(_delta):
	spots_node = get_node("Level").get_child(0).get_node("Spots")
	current_level = get_node("Level").get_child(0)
	var spot_count = spots_node.get_child_count()
	
	if Input.is_action_just_pressed("restart"):
		SceneChanger.change_scene(current_level.level_number)
	
	if !game_ended:	
		for i in spots_node.get_children():
			if i.active == true:
				spot_count -= 1
	if spot_count == 0:
		game_ended = true
		SceneChanger.change_scene(current_level.level_number + 1)
		#var current_level = get_node("Level").get_child(0)
		#get_node("Level").remove_child(current_level)
		#get_node("Level").add_child(next_level.instance())

func on_Scene_changed():
	game_ended = false
