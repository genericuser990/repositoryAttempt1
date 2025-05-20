extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player := $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KillBox_body_entered(body):
	EventBus.emit_signal("onPlayerHit")
	player.respawn()
	pass # Replace with function body.
