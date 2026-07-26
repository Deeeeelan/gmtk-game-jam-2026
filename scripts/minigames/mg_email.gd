extends Control

@onready var game_manager: Node = GameManager

var emails: Array[Dictionary] = [ #TODO: Write the emails
	{
		"Title": "Q4 Budget Updates", 
		"Subject": "From: Steven from Accounting\nSubject: Q4 Budget Updates", 
		"Body": ""
	},
	{
		"Title": "lorum ipsum salt",
		"Subject": "From: lorum ipsum salt\nSubject: lorum ipsum salt", 
		"Body": "lorum ipsum salt"
	},
	{
		"Title": "lorum ipsum salt",
		"Subject": "From: lorum ipsum salt\nSubject: lorum ipsum salt", 
		"Body": "lorum ipsum salt"
	},
	{
		"Title": "lorum ipsum salt",
		"Subject": "From: lorum ipsum salt\nSubject: lorum ipsum salt", 
		"Body": "lorum ipsum salt"
	},]

var responses: Array[Dictionary] = [ #TODO: Write responses
	{
		1: "lorum ipsum salts",
		2: "lorum ipsum salt",
		3: "lorum ipsum salt",
		"Correct": 1
	},
	{
		1: "lorum ipsum salts",
		2: "lorum ipsum salt",
		3: "lorum ipsum salt",
		"Correct": 1
	},
		{
		1: "lorum ipsum salts",
		2: "lorum ipsum salt",
		3: "lorum ipsum salt",
		"Correct": 1
	},
	{
		1: "lorum ipsum salts",
		2: "lorum ipsum salt",
		3: "lorum ipsum salt",
		"Correct": 1
	}]
	
func _ready():
	pass
	
	
