extends Node
class_name StateManager
@export var stateRegister: Dictionary;
@export var defaultState: String;
var activeState;

func _ready():
	self.changeState(defaultState);

func getState(stateName):
	return get_node(stateRegister[stateName]) as State;

func changeState(stateName):
	if activeState != null:
		if activeState.stateIdentifier == stateName:
			return
		activeState.onStateDisabled();
		print(get_stack())
		print("Active State: " + activeState.stateIdentifier + " -> " + stateName)
	activeState = self.getState(stateName);
	activeState.onStateEnabled();

func isActive(stateName):
	return activeState != null and activeState.stateIdentifier == stateName
