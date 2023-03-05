extends WeaponState
class_name WepReloadClipState
@export var reloadAnimProperty: String;
@export var idleState: String

func onStateEnabled():
	super.onStateEnabled()
	if ammoManager.canReload():
		self.animationTree[reloadAnimProperty] = true
	else:
		self.stateManager.changeState(idleState)

func onReloadAnimFinished():
	ammoManager.reload();
	self.animationTree[reloadAnimProperty] = false
	self.stateManager.changeState(idleState)
