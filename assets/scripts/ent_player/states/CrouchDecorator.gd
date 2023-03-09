extends PlayerState
class_name CrouchDecorator
@export var _wrappedState: NodePath
@onready var wrappedState = get_node(_wrappedState)

func onStateEnabled():
	super.onStateEnabled()
	wrappedState.onStateEnabled()
	player_manifest.player.transform.scale.z = 0.5

func stateProcessing(delta):
	wrappedState.stateProcessing(delta)

func onStateDisabled():
	super.onStateDisabled()
	player_manifest.player.transform.scale.z = 1.0
	wrappedState.onStateDisabled()
