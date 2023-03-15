extends Node
class_name StateManager
var activeState;

func changeState(newState):
	if newState is NodePath:
		_change_state_by_path(newState)
	else:
		_change_state_by_object(newState)

func _change_state_by_path(path: NodePath):
	_change_state_by_object(self.get_parent().get_node(path))

func _change_state_by_object(state: State):
	if activeState != null:
		if activeState == state:
			return
		activeState.onStateDisabled();
		print(get_stack())
		print("Active State: " + activeState.stateIdentifier + " -> " + state.stateIdentifier)
	activeState = state;
	activeState.onStateEnabled()
func _process(delta):
	if activeState!= null:
		activeState.stateProcessing(delta)

func isActive(statePath):
	return activeState != null and activeState == get_node(statePath)
