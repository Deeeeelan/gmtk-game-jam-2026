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
		"icon": "res://assets/images/app_icons/word.png",
	},
	{
		"path": "res://assets/minigames/mg_sign.tscn",
		"name": "Sign",
		"icon": "res://assets/images/app_icons/sign_document.png",
	},
	{
		"path": "res://assets/minigames/mg_email.tscn",
		"name": "Email",
		"icon": "res://assets/images/app_icons/email.png",
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
	
func _ready() -> void:
	pass
