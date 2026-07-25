extends Control
class_name MinigameWindow

var title: String
var content: Node2D
var can_close: bool = true
var can_resize: bool = true
var can_move: bool = true

var dragging = false
var offset_drag: Vector2 = Vector2.ZERO

func close():
	queue_free()

func initialize(cn: Node2D):
	content = cn
	#TODO: instantiate window
	#TODO: set up handlers for dragging and resizing

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			dragging = false

func _process(delta: float) -> void:
	if dragging and get_viewport().get_visible_rect().has_point(get_viewport().get_mouse_position()):
		position = get_viewport().get_mouse_position() - offset_drag

func _ready() -> void:
	$Top.gui_input.connect(func(event: InputEvent):
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				dragging = true
				offset_drag = get_viewport().get_mouse_position() - position
	)
	
	$Top/MarginContainer/AspectRatioContainer/Exit.pressed.connect(close)
