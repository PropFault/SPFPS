extends Node
class_name StateManager
var activeState;

func changeState(var statePath):
	var state = self.get_parent().get_node(statePath);
	if activeState != null:
		if activeState == state:
			return
		activeState.onStateDisabled();
		print(get_stack())
		print("Active State: " + activeState.stateIdentifier + " -> " + state.stateIdentifier)
	activeState = state;
	activeState.onStateEnabled();

func _process(delta):
	if activeState!= null:
		activeState.stateProcessing(delta)

func isActive(var statePath):
	return activeState != null and activeState == get_node(statePath)
