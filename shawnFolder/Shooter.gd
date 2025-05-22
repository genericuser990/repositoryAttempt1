extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 100
var vel = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	look_at_mouse()
	move()

func move():
	vel.x = Input.get_axis("a_pressed", "d_pressed")
	vel.y = Input.get_axis("w_pressed", "s_pressed")
	vel = vel.normalized() * speed
	move_and_slide(vel)
	
func look_at_mouse():
	look_at(get_global_mouse_position())
