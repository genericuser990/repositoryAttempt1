extends KinematicBody2D

signal paddle_bounced
signal wall_bounced

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dx = 1;
var dy = -1;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dx
	position.y += dy

func _on_Area_2D2_body_entered(body):
	print("top")
	dy *= -1
	emit_signal("wall_bounced")


func _on_Area_2D_body_entered(body):
	print("bottom")
	dy *= -1
	emit_signal("wall_bounced")	

func _on_Paddle_body_entered(body):
	print("right")
	dx *= -1
	emit_signal("paddle_bounced")
