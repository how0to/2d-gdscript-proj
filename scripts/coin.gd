extends Area2D

@onready var GameManager: Node = $"../GameManager"

func _on_body_entered(body: Node2D) -> void:
	GameManager.AddScore(1)
	queue_free()
