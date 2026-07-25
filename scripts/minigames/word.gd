extends Control

const TEXTS = [
	"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dui quam, vestibulum sit amet lacus non, iaculis imperdiet sem.",
	"Funny text.",
]

func _input(event: InputEvent) -> void:
	pass

func play():
	var cur_text = TEXTS[randi_range(0,len(TEXTS) - 1)]
	$Center/Hide.text = cur_text
	$Center/Input.text = ""
	$Center/Input.text_changed.connect(func():
		if $Center/Input.text == cur_text:
			$Center/Input.add_theme_color_override("font_color", Color(0.0, 0.4, 0.0, 1.0))
			print('matched')
		else:
			if $Center/Input.text != cur_text.substr(0, len($Center/Input.text)):
				$Center/Input.add_theme_color_override("font_color", Color(0.396, 0.0, 0.0, 1.0))
			else:
				$Center/Input.add_theme_color_override("font_color", Color(0.0, 0.0, 0.0, 1.0))
	)
	
	
func _ready() -> void:
	play()
