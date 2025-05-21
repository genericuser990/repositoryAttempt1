extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ui := $Control
onready var ball := $Ball


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("hit_paddle", self, "_on_ball_hit_paddle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass
func _on_ball_hit_paddle():
	ui.add_score(1)
