extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed := 100
var vel := Vector2.ZERO
var mousepos := get_global_mouse_position()

# Called when the node enters the scene tree for the first time.

func setBullet(_position: Vector2, rotation : float):
	var dir = Vector2.RIGHT.rotated(rotation)
	rotation_degrees = rotation * 180 / PI
	position = _position
	vel = dir.normalized() * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += vel * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
