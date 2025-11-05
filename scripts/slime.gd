extends Node2D

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60

var dir = 1

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		sprite.flip_h = true
		dir = -1
	if ray_cast_left.is_colliding():
		sprite.flip_h = false
		dir = 1
	position.x += dir * SPEED * delta
