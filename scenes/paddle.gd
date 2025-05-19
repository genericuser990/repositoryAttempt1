extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var sprite := $foo

func _ready():
	sprite.offset.x = 50
