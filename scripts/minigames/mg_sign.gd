extends Control

@onready var game_manager: Node = GameManager

var drawable_columns = 64
var drawable_rows = 128

func play() -> void:
	#$ColorRect.gui_input.connect(func(event: InputEvent):
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				#print("hi world")
	#)
	pass
	
func createDrawableArea(location:Vector2) -> void:
	pass
		
func _ready() -> void:
	play()
