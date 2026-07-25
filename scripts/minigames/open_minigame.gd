extends Button

@export var game_path: String = ""
@export var game_name: String = ""

const MINIGAME_WINDOW = preload("res://assets/nodes/minigame_window.tscn")

func _pressed() -> void:
	var win := MINIGAME_WINDOW.instantiate()
	win.title = game_name
	win.initialize(load(game_path).instantiate())
	%Windows.add_child(win)
