extends CharacterBody2D

@onready var AnimSprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 4700.0
const JUMP_VELOCITY = -250.0
var CanJump = false

func Jump():
	if CanJump:
		velocity.y = JUMP_VELOCITY
		CanJump = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		Jump()
	# Get the input direction and handle the movement.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		if direction == 1:
			AnimSprite.flip_h = false
		elif direction == -1:
			AnimSprite.flip_h = true
			
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	move_and_slide()
