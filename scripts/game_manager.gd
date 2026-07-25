extends Node

var score: int = 0
var total_games: int = 0

var game_streak: int = 0
var highest_streak: int = 0

var speed_mult: int = 100 # speed mult increasing = decreases deadline time
var lives: int = 1

var currentGame: Node
var currentWindow: Variant

func playGame(game: String) -> bool:
	print("playing: ", game)
	if Minigames.games.has(game):
		print("data: ", Minigames.games[game])
		var game_data = Minigames.games[game]
		var game_scene = load(game_data.node).instantiate()
		
	else:
		push_warning("no game data!")
	return false

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
		var game_id = randi_range(0, len(Minigames.games))
		var game = Minigames.games[game_id]
		var outcome = await playGame(game_id)
		if outcome:
			# WIN
			total_games += 1
			game_streak += 1
			score += 200
			if game_streak >= 5 and game_streak % 5 == 0:
				if game_streak > highest_streak && highest_streak % 10 == 0:
					lives += 1
				speedUp()
				score += 1000
		else:
			lives -= 1
			if game_streak >= 5:
				speedDown()
				score -= 300
			game_streak = 0
			score -= 100
			score = max(0, score)
		if lives == 0:
			lose()
			break
	
func _ready() -> void:
	pass
