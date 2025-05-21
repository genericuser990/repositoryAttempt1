extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ScoreLabel := $ScoreLabel
onready var TimeLabel := $TimeLabel
onready var GameOver := $GameOver

var score = 0
var time = 0
var game_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	game_not_over()

func _process(delta):
	if (!game_end):
		add_time(delta)


func game_not_over():
	GameOver.hide()
	game_end = false
	
func game_over():
	GameOver.show()
	game_end = true


func set_score(string):
	ScoreLabel.text = string
	
func set_time(string):
	TimeLabel.text = string

func add_score(n) :
	score += n
	set_score("SCORE: %s" % score)
	
func add_time(n) :
	time += n
	time = stepify(time, 0.01)
	set_time("TIME: %s" % time)
