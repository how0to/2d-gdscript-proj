extends Node

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game manager ready")
	
func AddScore(amount):
	score += amount
	print("Score: " + str(score))
