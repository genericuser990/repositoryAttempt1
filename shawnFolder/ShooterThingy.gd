extends Node

export (PackedScene) var Bullet
onready var shooter := $Shooter
onready var timer := $Timer
var can_shoot := true

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", self, "_on_timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_pressed("left_click") and can_shoot):
		# create bullet
		can_shoot = false
		timer.start()
		var b = Bullet.instance()
		b.setBullet(shooter.position, shooter.rotation)
		add_child(b)

func _on_timeout():
	can_shoot = true
