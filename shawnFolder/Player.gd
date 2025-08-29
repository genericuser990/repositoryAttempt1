extends KinematicBody2D

export var walk_speed = 75
export var run_speed = 150
export var air_speed = 100
export var jump_speed = 700
export var gravity = 75
var speed = walk_speed
var velocity = Vector2.ZERO
var screen_size

enum States {WALKING, RUNNING, JUMPING, FALLING}

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

onready var state = States.WALKING
onready var prev_state = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(state)
	
	velocity.x = 0
	
	if !is_on_floor():
		set_state(States.FALLING)
	elif Input.is_action_just_pressed("move_up"):
		set_state(States.JUMPING)
	elif Input.is_action_pressed("shift_pressed"):
		set_state(States.RUNNING)
	else:
		set_state(States.WALKING)
	
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	
	move_and_slide(velocity, Vector2(0,-1))
	
	screen_clamp()

func screen_clamp():
	# Prevent going off screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func respawn() :
	print("respawn")
	position = Vector2(screen_size.x/2, screen_size.y/2)
	
func set_state(new_state):
	if state != new_state:
		prev_state = state
		state = new_state
		
	
	
	if prev_state == States.FALLING:
		velocity.y = 1

	if new_state == States.WALKING:
		speed = walk_speed
	elif new_state == States.RUNNING:
		speed = run_speed
	elif new_state == States.JUMPING:
		velocity.y = -jump_speed
	elif new_state == States.FALLING:
		speed = air_speed
		if prev_state == States.JUMPING:
			velocity.y += 0.75 * gravity
		else:
			velocity.y += gravity
