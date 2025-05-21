extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 120
var vel = Vector2(0, speed)
var game_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (!game_end):
		if Input.is_action_pressed("move_up"):
			move_and_slide(vel.rotated(PI))
		if Input.is_action_pressed("move_down"):
			move_and_slide(vel)

func game_over():
	game_end = true
