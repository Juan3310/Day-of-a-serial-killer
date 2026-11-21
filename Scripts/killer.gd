extends CharacterBody2D

var SPEED = 800.0
var SPEED_NOW 
var JUMP_VELOCITY = 0
var JUMP_CAP = -600
var ACCEL = 10

var bullet_count : int
var cd_timer : Timer

var direction
var looking_at = 0

var aiming_direction : Vector2

signal shoot(direction : Vector2, killer_position : Vector2)
signal karate_chop

func _ready() -> void:
	cd_timer = $Node2D/Cooldown
	
	SPEED_NOW = 0
	
	bullet_count = 2

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
	
	if direction == 1:
		$AnimatedSprite2D.scale.x = -4 * direction
		$Node2D.scale.x = -1
	elif direction == -1:
		$AnimatedSprite2D.scale.x = -4 * direction
		$Node2D.scale.x = 1

	if direction != 0:
		if is_on_floor():
			$AnimatedSprite2D.play("Walk")
		looking_at = direction
		if SPEED_NOW < SPEED:
			SPEED_NOW += ACCEL
		else:
			SPEED_NOW = SPEED
		velocity.x = direction * SPEED_NOW
	else:
		if SPEED_NOW > 0:
			if is_on_floor():
				$AnimatedSprite2D.play("Walk")
			SPEED_NOW -= ACCEL * 2
		else:
			$AnimatedSprite2D.play("default")
			SPEED_NOW = 0
		velocity.x = SPEED_NOW * looking_at
	move_and_slide()
	
func _process(_delta: float) -> void:
	if bullet_count > 0:
		cd_timer.wait_time = 0.5
	else:
		cd_timer.wait_time = 1.5
	
	if Input.is_action_just_pressed("Shoot") and cd_timer.time_left == 0:
		cd_timer.start()
		if bullet_count > 0:
			shoot.emit(aiming_direction, position + Vector2(20 * looking_at, 0))
			bullet_count -= 1
		else:
			karate_chop.emit()
