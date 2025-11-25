extends Node

@onready var ScoreLabel: Label = $"../Player/Camera2D/GUI/Score"

var score = 0
	
func AddScore(amount):
	score += amount
	ScoreLabel.text = "Score: " + str(score)
