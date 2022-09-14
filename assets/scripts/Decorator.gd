extends State
class_name Decorator

onready var decoratedState = get_child(0) as State

func onStateEnabled():
	.onStateEnabled()

func onStateDisabled():
	.onStateDisabled()
