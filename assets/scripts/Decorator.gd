extends State
class_name Decorator

@onready var decoratedState = get_child(0) as State

func onStateEnabled():
	super.onStateEnabled()

func onStateDisabled():
	super.onStateDisabled()
