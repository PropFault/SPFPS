extends Node
@export var _camera: NodePath
@export var effectMultiplier: float = 1.1
@export var smoothing: float = 0.2
@onready var camera = get_node(_camera)
@onready var baseFov = camera.fov
var trailingVal = 0.0
var targetVal = 0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	trailingVal += (targetVal - trailingVal) / smoothing * delta
	camera.fov = baseFov + (effectMultiplier - 1) * trailingVal


func _on_ent_player_velocityChanged(velocity):
	targetVal = velocity.length_squared()
