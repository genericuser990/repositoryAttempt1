extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var sprite := $Faceset

var dx = 1;
var dy = -1;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var temp = sprite.texture.get_data()
	temp.lock()
	
	position.x += dx
	position.y += dy


func _on_RigidBody2D2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("bot")
	dy *= -1




func _on_RigidBody2D_body_entered(body):
	print("top")
	dy *= -1
