extends RichTextLabel
@export var _target: Node3D
@onready var _lastPos = Vector3.ZERO;

func _physics_process(delta):
	self.text = str(((_target.global_transform.origin -_lastPos).length()/delta))
	_lastPos = _target.global_transform.origin
	
