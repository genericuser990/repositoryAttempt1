extends RigidBody2D

var col 
var spr 
func setRopePiece(length):
	col = $CollisionShape2D
	spr = $Sprite
	col.shape.height = length 
	spr.scale.y = length * 0.08 / 4
