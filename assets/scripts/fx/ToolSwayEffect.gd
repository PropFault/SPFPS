extends Node
export(NodePath) var _target
export(float) var effectMultiplier = 1.1
export(float) var smoothing = 0.2
onready var target = get_node(_target)
onready var baseOrigin = target.transform.origin
var trailingVal = Vector3(0,0,0)
var targetVal = Vector3(0,0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	trailingVal += (targetVal - trailingVal) / smoothing * delta
	var parent = target
	var add = parent.global_transform.basis.xform_inv(trailingVal) * (effectMultiplier - 1)
	target.transform.origin = baseOrigin - add 
	print(add)




func _on_ent_player_velocityChanged(velocity):
	targetVal = velocity
