

extends Node
export(NodePath) var _target
export(NodePath) var _angularSource
export(float) var effectMultiplier = 1.1
export(float) var translateEffectMultiplier = 1.0
export(float) var rotateEffectMultiplier = 1.0
export(float) var locationSmoothing = 0.2
export(float) var angularSmoothing = 0.2
onready var angularSource = get_node(_angularSource)
onready var target = get_node(_target)
onready var baseOrigin = target.transform.origin
var trailingVal = Vector3(0,0,0)
var trailingBasis = Basis(Vector3(0,0,0),Vector3(0,0,0),Vector3(0,0,0))
onready var baseOrientation = target.transform.basis
var targetVal = Vector3(0,0,0)
onready var lastRecOrigin = target.global_transform.origin
onready var lastRecBasis = target.global_transform.basis


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _basis_subtract(a, b):
	return Basis(a.x - b.x, a.y - b.y, a.z - b.z)
func _basis_divide(a, b):
	return Basis(a.x / b, a.y / b, a.z / b)
func _process(delta):
	#target.global_transform.origin = lastRecOrigin.linear_interpolate(target.global_transform.origin, 0.9)
	target.global_transform.basis = lastRecBasis.slerp(target.global_transform.basis, 0.9).orthonormalized ( )
	lastRecOrigin = target.global_transform.origin
	lastRecBasis = target.global_transform.basis




func _on_ent_player_velocityChanged(velocity):
	targetVal = Vector3(-velocity.x, velocity.y, -velocity.z)
