extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed := 100
var vel := Vector2.ZERO
var mousepos := get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	mousepos = get_global_mouse_position()
	vel = (mousepos - position).normalized() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += vel * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
