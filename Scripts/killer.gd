extends CharacterBody2D

var SPEED = 500.0
var SPEED_NOW 
var JUMP_VELOCITY = -200.0
var ACCEL = 10


var direction
var looking_at = 0

var can_jump : bool

func _ready() -> void:
	SPEED_NOW = 500
	can_jump = true


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("Jump"):
		if JUMP_VELOCITY > -900:
			JUMP_VELOCITY -= 100
		velocity.y = JUMP_VELOCITY


	JUMP_VELOCITY = -200

	direction = Input.get_axis("Go left", "Go right")

	if direction != 0:
		looking_at = direction
		if SPEED_NOW < SPEED:
			SPEED_NOW += ACCEL
		else:
			SPEED_NOW = SPEED
		velocity.x = direction * SPEED_NOW
	else:
		if SPEED_NOW > 0:
			SPEED_NOW -= ACCEL * 2
		else:
			SPEED_NOW = 0
		velocity.x = SPEED_NOW * looking_at
	#velocity.x = direction * SPEED_NOW
	move_and_slide()
