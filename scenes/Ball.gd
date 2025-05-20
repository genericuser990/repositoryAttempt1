extends KinematicBody2D

signal paddle_bounced
signal wall_bounced

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100
var vel = Vector2(speed, speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#called at set 60fps (more notes in doc)
func _physics_process(delta):
	var collsion = move_and_collide(vel* delta)
	if collsion:
		vel = vel.bounce(collsion.normal)
