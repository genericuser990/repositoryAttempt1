extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var score1 := $Label
onready var score2 := $Label2

var count1 = 0
var count2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func add1() :
	count1 += 1
	score1.text = "score 1 %s" % count1
	
func add2() :
	count2 += 1
	score2.text = "score 2 %s" % count2
