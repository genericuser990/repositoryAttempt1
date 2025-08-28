extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ui := $Control
onready var ball := $Ball
onready var paddle := $Paddle
onready var paddle2 = $Paddle2


# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("hit_paddle", self, "_on_ball_hit_paddle")
	ball.connect("game_over", self, "_on_game_over")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass
func _on_ball_hit_paddle():
	ui.add_score(1)

func _on_game_over():
	ui.game_over()
	paddle.game_over()
	paddle2.game_over()
