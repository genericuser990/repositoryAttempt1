extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ui := $Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass

func _on_Ball_paddle_bounced():
	ui.add1()


func _on_Ball_wall_bounced():
	ui.add2()
