extends Area2D

@onready var GameManager: Node = $"../../GameManager"
@onready var AnimPlayer: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	GameManager.AddScore(1)
	AnimPlayer.play("PickupAnim")
	await get_tree().create_timer(0.2).timeout
	queue_free()
