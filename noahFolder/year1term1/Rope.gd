extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var ropePeices := 5
export var jointSoftness := 0.05
var length

onready var ropeEnd1 := $RopeEnd1
onready var ropeEnd2 := $RopeEnd2
export (PackedScene) var ropePeice

# Called when the node enters the scene tree for the first time.
func _ready():
	length = (ropeEnd2.position - ropeEnd1.position).length()
	var ropePieceLength = length / ropePeices
	
	var ratio =  1.0 / ropePeices
	var angle = (ropeEnd2.position - ropeEnd1.position).angle() - PI/2
	
	var bef = ropeEnd1
	
	for i in ropePeices:
		var peiceInstance = ropePeice.instance()
		peiceInstance.position = ropeEnd1.position.linear_interpolate(ropeEnd2.position, ratio * (i+0.5))
		peiceInstance.rotation_degrees = angle * 180 / PI
		peiceInstance.setRopePiece(ropePieceLength)
		add_child(peiceInstance)
		
		var joint = PinJoint2D.new()
		joint.node_a = bef.get_path()
		joint.node_b = peiceInstance.get_path()
		joint.position = ropeEnd1.position.linear_interpolate(ropeEnd2.position, ratio * i)
		joint.softness = jointSoftness
		add_child(joint)
		
		bef = peiceInstance
	
	var joint = PinJoint2D.new()
	joint.node_a = bef.get_path()
	joint.node_b = ropeEnd2.get_path()
	joint.position = ropeEnd2.position
	add_child(joint)
		
