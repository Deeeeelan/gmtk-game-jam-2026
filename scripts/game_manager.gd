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

ime = max(5, floori(max_time * .75))
		
	
func _ready() -> void:
	pass
