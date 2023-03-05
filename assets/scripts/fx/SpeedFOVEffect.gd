extends Node
@export var effectMultiplier: float = 1.1
@export var smoothing: float = 0.2
@export var camera: Camera3D
@onready var baseFov = camera.fov
var trailingVal = 0.0
var targetVal = 0.0

func _process(delta):
	trailingVal += (targetVal - trailingVal) / smoothing * delta
	camera.fov = baseFov + (effectMultiplier - 1) * trailingVal


func _on_ent_player_velocityChanged(velocity):
	targetVal = velocity.length_squared()
