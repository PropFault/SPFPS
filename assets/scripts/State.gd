extends Node
class_name State
@export var stateIdentifier: String;
@export var stateManager: StateManager
var stateEnabled = false
func onStateEnabled():
	stateEnabled = true

func onStateDisabled():
	stateEnabled = false
