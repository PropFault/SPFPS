extends Node
@export var _target: NodePath
@export var _source: NodePath
@export var effectMultiplier: float = 1.1
@export var angularEffectMultiplier: float = 1
@export var smoothing: float = 0.2
@onready var target = get_node(_target)
@onready var source = get_node(_source)
@onready var baseOrigin = target.transform.origin
var trailingVal = Vector3(0,0,0)
@onready var lastOrigin = source.global_transform.origin
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



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


