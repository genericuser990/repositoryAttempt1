extends Node

onready var viewport := $Viewport

func _ready():
	viewport.setViewPort(get_viewport().world_2d)



