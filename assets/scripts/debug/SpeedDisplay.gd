extends RichTextLabel

export(NodePath)var target;
onready var _target = get_node(target);
onready var _lastPos = Vector3.ZERO;

func _physics_process(delta):
	self.text = ((_target.global_transform.origin -_lastPos).length()/delta) as String
	_lastPos = _target.global_transform.origin
	
