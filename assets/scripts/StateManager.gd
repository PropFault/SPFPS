extends Node
class_name StateManager
export(Dictionary)var stateRegister;
export(String)var defaultState;
var activeState;

func _ready():
	self.changeState(defaultState);

func getState(var stateName):
	return get_node(stateRegister[stateName]);

func changeState(var stateName):
	if activeState != null:
		if activeState.stateIdentifier == stateName:
			return
		activeState.onStateDisabled();
		print(get_stack())
		print("Active State: " + activeState.stateIdentifier + " -> " + stateName)
	activeState = self.getState(stateName);
	activeState.onStateEnabled();

func isActive(var stateName):
	return activeState != null and activeState.stateIdentifier == stateName
