extends StaticBody2D


onready var button := $TextureButton
var of := Vector2(0,0)
var mouseDown = false
# Called when the node enters the scene tree for the first time.
func _ready():
	button.connect("button_down", self, "on_button_down")
	button.connect("button_up", self, "on_button_up")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (mouseDown):
		# idk why 3 but viewport demands it
		# actually its global mouse is in screen pixels, viewport has it's own pixel resolution
		position = get_global_mouse_position()/3


func on_button_down():
	mouseDown = true
	#of = get_global_mouse_position() - position
	
func on_button_up():
	mouseDown = false
