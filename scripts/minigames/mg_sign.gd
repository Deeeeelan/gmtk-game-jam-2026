extends Control

@onready var game_manager: Node = GameManager
@onready var canvas: GridContainer = $Canvas

var doc_info: Dictionary = {
	1: [{
			"loc": Vector2(385, 370), "size": Vector2(50, 14)}],
	2: [{
			"loc": Vector2(385, 370), "size": Vector2(10, 10)},
		{
			"loc": Vector2(100, 100), "size": Vector2(15, 15)}],
	3: [{
			"loc": Vector2(), "size": Vector2()},
		{
			"loc": Vector2(), "size": Vector2()},
		{
			"loc": Vector2(), "size": Vector2()}]}

var filled: Dictionary = {
	1: true,
	2: true,
	3: true}

var is_drawing: bool = false
var canvas_size = Vector2(2, 2)
var canvases = []

var doc_count: int = 10

func _ready() -> void:
	play()

func play() -> void:
	while doc_count > 0:
		var current_doc = 1#(randi() % 3) + 1
		for i in doc_info[current_doc]:
			createDrawableArea(i["loc"], i["size"])
		
		
		doc_count -= 1
		break #debug

func createDrawableArea(location: Vector2i, dimentions: Vector2i) -> void:
	var canv = canvas.duplicate()
	add_child(canv)
	canvases.append(canv)
	canv.global_position = location
	canv.columns = dimentions.x
	for i in range(dimentions.x * dimentions.y):
		var cell = TextureButton.new()
		cell.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		cell.custom_minimum_size = canvas_size
		cell.stretch_mode = TextureButton.STRETCH_SCALE
		cell.ignore_texture_size = true
		cell.texture_normal = load("res://assets/images/misc/white1x1pixel.png")
		canv.add_child(cell)

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
	for canv in canvases:
		var canvas_buttons = canv.get_children()
		for i in canvas_buttons:
			var button_pos = i.global_position
			var button_size = i.custom_minimum_size
			if button_pos.x <= mouse_pos.x and button_pos.x + button_size.x >= mouse_pos.x and button_pos.y <= mouse_pos.y and button_pos.y + button_size.y >= mouse_pos.y:
				return i
	return null
