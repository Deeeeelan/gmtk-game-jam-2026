extends Node

@onready var countdown_text = %Countdown

func game_loop() -> void:
	countdown_text.visible = true
	$"../Countdown".start()
	$"../Countdown".timeout.connect(func():
		GameManager.curr_time -= 1
		$"../Countdown".text = "Deadline:\n" + str(GameManager.curr_time)
	)
	while true:
		GameManager.curr_time = GameManager.max_time
		var game_id = randi_range(0, len(GameManager.GAMES))
		var game = GameManager.GAMES[game_id]
		
		
