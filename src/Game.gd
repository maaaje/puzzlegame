extends Node2D

var game_ended = false

func _ready():
	pass

func _process(_delta):
	var spot_count = $Spots.get_child_count()
	if !game_ended:	
		for i in $Spots.get_children():
			if i.active == true:
				spot_count -= 1
	if spot_count == 0:
		game_ended = true
		
