extends Node

var score: int = 0
var total_games: int = 0

var curr_time: int = 60
var max_time: int = 60

var speed_mult: int = 100 # speed mult increasing = decreases deadline time

var currentGame: Node
var currentWindow: Variant

const APP = preload("res://assets/nodes/app.tscn")

const GAMES = [
	{
		"path": "res://assets/minigames/mg_word.tscn",
		"name": "Word",
	},
	{
		"path": "res://assets/minigames/mg_sign.tscn",
		"name": "Sign",
	},
]

func gameWin() -> void:
	print("Game Completed")
	score += 1

func speedUp() -> void:
	speed_mult = min(500, speed_mult + 50)
	#TODO Animation
	
func speedDown() -> void:
	speed_mult = max(100, speed_mult - 25)
	#TODO
	
func lose() -> void:
	print("lose")
	#TODO

## @deprecated: Restructuring the warioware-like format so that multiple games open at once, one main deadline
func game_loop() -> void:
	# countdown_text.visible = true
	$"../Countdown".start()
	$"../Countdown".timeout.connect(func():
		curr_time -= 1
		$"../Countdown".text = "Deadline:\n" + str(curr_time)
	)
	while true:
		curr_time = max_time
		var game_id = randi_range(0, len(GAMES))
		var game = GAMES[game_id]
		
		max_time = max(5, floori(max_time * .75))
		
	
func _ready() -> void:
	pass
