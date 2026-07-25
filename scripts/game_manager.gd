extends Node

var score: int = 0
var total_games: int = 0

var speed_mult: int = 100 # speed mult increasing = decreases deadline time

var currentGame: Node
var currentWindow: Variant

#func playGame(game: String) -> bool: Depracated
	#print("playing: ", game)
	#if Minigames.games.has(game):
		#print("data: ", Minigames.games[game])
		#var game_data = Minigames.games[game]
		#var game_scene = load(game_data.node).instantiate()
		#
	#else:
		#push_warning("no game data!")
	#return false

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
	while true:
		#var game_id = randi_range(0, len(Minigames.games))
		#var game = Minigames.games[game_id]
		var outcome #= await playGame(game_id)
	
func _ready() -> void:
	pass
