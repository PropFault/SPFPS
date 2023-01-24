extends WeaponState
class_name WepInitState
export(NodePath)var idleState;

func animInitDone():
	self.stateManager.changeState(idleState)
