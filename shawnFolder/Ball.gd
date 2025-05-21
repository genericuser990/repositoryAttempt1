extends KinematicBody2D

signal paddle_bounced
signal wall_bounced

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var vel = Vector2(1, 1).normalized() * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#called at set 60fps (more notes in doc)
func _physics_process(delta):
	var collision = move_and_collide(vel* delta)
	if collision:
		vel = vel.bounce(collision.normal)
		if collision.get_collider().name == "Paddle" or collision.get_collider().name == "Paddle2":
			# Increment score here later
			print("paddle")
