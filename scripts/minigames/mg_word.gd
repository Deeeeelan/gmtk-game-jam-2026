extends Control

@onready var game_manager: Node = GameManager

var win = false

const TEXTS = [
	"debug",
	"Funny text.",]

func _ready() -> void:
	play()

func play():
	var cur_text = TEXTS[randi_range(0,len(TEXTS) - 1)]
	$Center/Hide.text = cur_text
	$Center/Input.text = ""
	$Center/Input.text_changed.connect(func():
		if $Center/Input.text == cur_text:
			$Center/Input.add_theme_color_override("font_color", Color(0.0, 0.4, 0.0, 1.0))
			if not win:
				win = true
				game_manager.gameWin()
				print('matched')
		else:
			# Are all current chars correct?
			if $Center/Input.text != cur_text.substr(0, len($Center/Input.text)):
				$Center/Input.add_theme_color_override("font_color", Color(0.396, 0.0, 0.0, 1.0))
			else:
				$Center/Input.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
	)

func _input(event: InputEvent) -> void:
	pass
