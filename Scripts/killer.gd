extends CharacterBody2D

var SPEED = 800.0
var SPEED_NOW 
var JUMP_VELOCITY = 0
var JUMP_CAP = -600
var ACCEL = 10

var direction
var looking_at = 0

var aiming_direction : Vector2

signal shoot(direction : Vector2, killer_position : Vector2)

func _ready() -> void:
	SPEED_NOW = 0

func _physics_process(delta: float) -> void:
	aiming_direction = get_local_mouse_position().normalized()
	
	if Input.is_action_pressed("Jump"):
		if JUMP_VELOCITY >= JUMP_CAP:
			JUMP_VELOCITY -= 50
			velocity -= get_gravity() * 5 * delta
		else:
			velocity += get_gravity() * 2 * delta
	else:
		if is_on_floor():
			JUMP_VELOCITY = 0
		else:
			velocity += get_gravity() * 2 * delta
			JUMP_VELOCITY = -1000
			
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
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		shoot.emit(aiming_direction, position)
