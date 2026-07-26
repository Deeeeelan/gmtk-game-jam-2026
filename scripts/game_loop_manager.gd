extends Node

@onready var countdown_text = %Clock
@onready var fade = %Fade
@onready var promotion = %Promotion
const APP = preload("res://assets/nodes/app.tscn")

const MAX_GAMES: int = 1
const RANKS = [
	"Unpaid Intern",
	"Senior Intern",
	"Junior Janitor",
	"Toilet Lid Boy",
	"Pencil Sharpening Boy",
	"Coffee Boy",
	"Bagel Boy",
	"Senior Janitor",
	"Trainee",
	"Employee",
	"Accountant",
	"Junior Manager",
	"Senior Manager",
	"CEO",
]

func promote():
	promotion
	promotion.modulate = Color(0.0, 0.0, 0.0, 0.0)
	var tween = get_tree().create_tween()
	tween.tween_property(promotion, "modulate", Color(1.0, 1.0, 1.0, 1.0), 1.0)
	tween.play()
	
	await tween.finished
	

func start():
	fade.color = Color(0.0, 0.0, 0.0, 1.0)
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "color", Color(0.0, 0.0, 0.0, 0.0), 1.0)
	tween.play()
	
	await tween.finished
	game_loop()
	

func game_loop() -> void:
	$"../Countdown".start()
	$"../Countdown".timeout.connect(func():
		if GameManager.curr_time == 0:
			GameManager.lose()
		else:
			GameManager.curr_time -= 1
			countdown_text.text = str(GameManager.curr_time)
		var clock_state: float = float(GameManager.curr_time) / float(GameManager.max_time)
	)
	while true:
		GameManager.curr_time = GameManager.max_time
		for i in range(MAX_GAMES):
			var game_id = randi_range(0, len(GameManager.GAMES) - 1)
			var game = GameManager.GAMES[game_id]
			var app = APP.instantiate()
			app.get_node("Button").game_path = game.path
			app.get_node("Button").game_name = game.name
			app.get_node("List/Title").text = game.name
			app.get_node("List/MarginContainer/Icon").texture = load(game.icon)
			%AppList.add_child(app)
		
		while GameManager.cur_games < MAX_GAMES: await get_tree().create_timer(0.5).timeout
		print("NEXT")
		promote()
		GameManager.cur_games = 0
		GameManager.max_time = max(5, floori(GameManager.max_time * .75))
		
		for n in %AppList.get_children():
			n.queue_free()
		for n in %Windows.get_children():
			n.queue_free()
		
func _ready() -> void:
	start()
