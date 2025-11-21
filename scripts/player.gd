extends CharacterBody2D

@onready var AnimSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var floor_ray: RayCast2D = $FloorRay
@onready var floor_ray_2: RayCast2D = $FloorRay2
@onready var floor_ray_3: RayCast2D = $FloorRay3

const SPEED = 4700.0
const JUMP_VELOCITY = -250.0
var CanJump = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var OnFloor = false

func _physics_process(delta: float) -> void:
	OnFloor = is_on_floor()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		AnimSprite.play("Jump")
		
	if floor_ray.is_colliding() or floor_ray_2.is_colliding() or floor_ray_3.is_colliding():
		CanJump = true
	else:
		CanJump = false
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and CanJump:
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		if direction == 1:
			AnimSprite.flip_h = false
		elif direction == -1:
			AnimSprite.flip_h = true
		velocity.x = direction * SPEED * delta
		if is_on_floor():
			AnimSprite.play("Run")
	else:
		if is_on_floor():
			AnimSprite.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	move_and_slide()
