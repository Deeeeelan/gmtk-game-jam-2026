extends Control

@onready var game_manager: Node = GameManager

var win = false

const TEXTS = [
	"The quick brown fox jumped over the nasty dog. While that's true, I don't really like dogs. Personally, I'm a cat person.",
	"After one o' clock, I clock out. But I hate clocking out, so I use my magic stopwatch to stop time and work for eternity.",
	"I think everyone should study me. My button fastening business is bound to succeed, giving us money that can stack to SATURN!",
	"Work emails are lame. Working's lame. Why do I work? I don't know. I'm just an unpaid intern.",
	"Lorem Ipsum... salt?",
	"Sometimes, I just feel like working. There's just this strange urge, but it's probably just the money drawing me in.",
	"There's a distinct lack of Gravity and Grace here. We're all working With Reckless Abandon."
]

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
