extends Node

@onready var countdown_text = %Countdown

const APP = preload("res://assets/nodes/app.tscn")

func game_loop() -> void:
	countdown_text.visible = true
	$"../Countdown".start()
	$"../Countdown".timeout.connect(func():
		if GameManager.curr_time == 0:
			GameManager.lose()
		else:
			GameManager.curr_time -= 1
			countdown_text.text = "Deadline:\n" + str(GameManager.curr_time)
	)
	while true:
		GameManager.curr_time = GameManager.max_time
		for i in range(4):
			var game_id = randi_range(0, len(GameManager.GAMES) - 1)
			var game = GameManager.GAMES[game_id]
			var app = APP.instantiate()
			app.get_node("Button").game_path = game.path
			app.get_node("Button").game_name = game.name
			app.get_node("List/Title").text = game.name
			app.get_node("List/MarginContainer/Icon").texture = load(game.icon)
			%AppList.add_child(app)
				
		GameManager.max_time = max(5, floori(GameManager.max_time * .75))
		break

		
func _ready() -> void:
	game_loop()
