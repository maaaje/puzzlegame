tool
extends Node2D

export var level_number : int

func _get_configuration_warning():
	return "You need to set the levels number." if !level_number else ""
