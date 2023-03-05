extends Node
@export var effectMultiplier: float = 1.1
@export var angularEffectMultiplier: float = 1
@export var smoothing: float = 0.2
@export var target: Node3D
@export var source: Node3D
@onready var baseOrigin = target.transform.origin
var trailingVal = Vector3(0,0,0)
@onready var lastOrigin = source.global_transform.origin

func _process(delta):
	var originDelta = source.global_transform.origin - target.global_transform.origin
	var offsetOrigin = source.global_transform.origin + (-source.global_transform.basis.x - source.global_transform.basis.y - source.global_transform.basis.z).normalized() * originDelta.length() * angularEffectMultiplier
	var origin = offsetOrigin
	origin = Vector3(-origin.x, origin.y, -origin.z)
	var targetVal = (origin - lastOrigin)/delta
	trailingVal += (targetVal - trailingVal) / smoothing * delta
	var parent = target
	var add = trailingVal * parent.global_transform.basis * (effectMultiplier - 1)
	target.transform.origin = baseOrigin - add 
	print(add)
	lastOrigin = origin
