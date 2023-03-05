extends WeaponState
class_name WepInitState
@export var idleState: String;

func animInitDone():
	self.stateManager.changeState(idleState)
