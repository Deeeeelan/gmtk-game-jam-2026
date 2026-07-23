extends Node
class_name MinigameWindow

var title: String
var content: Node2D
var can_close: bool = true
var can_resize: bool = true
var can_move: bool = true

func close():
	pass

func initialize():
	pass
	#TODO: instantiate window
	#TODO: set up handlers for dragging and resizing
