extends Node

@onready var countdown_text = %Clock

const APP = preload("res://assets/nodes/app.tscn")

const MAX_GAMES: int = 4

func start():
	pass

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
		GameManager.cur_games = 0
		GameManager.max_time = max(5, floori(GameManager.max_time * .75))
		
		for n in %AppList.get_children():
			n.queue_free()
		for n in %Windows.get_children():
			n.queue_free()
		
func _ready() -> void:
	game_loop()
