extends KinematicBody2D

export var walk_speed = 50
export var run_speed = 150
var speed = walk_speed
var screen_size

enum States {IDLE, WALKING, RUNNING, JUMPING, FALLING}

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

onready var state = States.IDLE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("shift_pressed"):
		set_state(States.RUNNING)
	else:
		set_state(States.WALKING)
	
	velocity.x = Input.get_axis("move_left", "move_right") * speed
	velocity.y = Input.get_axis("move_up", "move_down") * speed

	move_and_slide(velocity)
	
	screen_clamp()

func screen_clamp():
	# Prevent going off screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func respawn() :
	print("respawn")
	position = Vector2(screen_size.x/2, screen_size.y/2)
	
func set_state(new_state):
	var prev_state = state
	state = new_state
	
	if new_state == States.IDLE:
		pass
	elif new_state == States.WALKING:
		speed = walk_speed
	elif new_state == States.RUNNING:
		speed = run_speed
	elif new_state == States.JUMPING:
		pass
	elif new_state == States.FALLING:
		pass
