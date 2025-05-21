extends KinematicBody2D

signal hit_paddle
signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var vel = Vector2(1, 1).normalized() * speed
var screen_size
var game_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


#called at set 60fps (more notes in doc)
func _physics_process(delta):
	if (!game_end):
		vel = vel.normalized() * speed
		speed *= 1 + delta/40
		
		if (out_of_bounds()):
			emit_signal("game_over")
			game_end = true
		
		var collision = move_and_collide(vel* delta)
		if collision:
			vel = vel.bounce(collision.normal)
			if collision.get_collider().name == "Paddle" or collision.get_collider().name == "Paddle2":
				# Increment score here later
				emit_signal("hit_paddle")

func out_of_bounds():
	# Why is the y-axis at x = -78 apparently
	return position.x > -78 + screen_size.x or position.x < -78
