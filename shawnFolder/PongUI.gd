extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ScoreLabel := $ScoreLabel
onready var TimeLabel := $TimeLabel

var score = 0
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	add_time(delta)

func set_score(string):
	ScoreLabel.text = string
	
func set_time(string):
	TimeLabel.text = string

func add_score(n) :
	score += n
	set_score("Score: %s" % score)
	
func add_time(n) :
	time += n
	time = stepify(time, 0.01)
	set_time("Time: %s" % time)
