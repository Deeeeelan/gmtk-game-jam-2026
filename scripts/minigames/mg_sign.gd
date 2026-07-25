extends Control

@onready var game_manager: Node = GameManager
@onready var canvas: GridContainer = $Canvas

var drawable_columns = 64
var drawable_rows = 32
var is_drawing = false

func play() -> void:
	#$ColorRect.gui_input.connect(func(event: InputEvent):
		#if event is InputEventMouseButton:
			#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				#print("hi world")
	#)
	pass
	
func createDrawableArea() -> void:
	canvas.columns = drawable_columns
	
	for i in range(drawable_columns * drawable_rows):
		var cell = TextureButton.new()
		cell.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		cell.custom_minimum_size = Vector2(4,4)
		cell.stretch_mode = TextureButton.STRETCH_SCALE
		cell.ignore_texture_size = true
		cell.texture_normal = load("res://assets/images/misc/white1x1pixel.png")
		canvas.add_child(cell)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_drawing = true
		var cell_at_mouse = getCellAtMouse(event.position)
		if cell_at_mouse:
			cell_at_mouse.modulate = Color(0, 0, 0)
		if event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			is_drawing = false
		
	if event is InputEventMouseMotion and is_drawing:
		var cell_at_mouse = getCellAtMouse(event.position)
		if cell_at_mouse:
			cell_at_mouse.modulate = Color(0, 0, 0)

func getCellAtMouse(mouse_pos: Vector2) -> TextureButton:
	var canvas_buttons = canvas.get_children()
	for i in canvas_buttons:
		var button_pos = i.global_position
		var button_size = i.custom_minimum_size
		if button_pos.x <= mouse_pos.x and button_pos.x + button_size.x >= mouse_pos.x and button_pos.y <= mouse_pos.y and button_pos.y + button_size.y >= mouse_pos.y:
			return i
	return null

func _ready() -> void:
	createDrawableArea()
	play()
