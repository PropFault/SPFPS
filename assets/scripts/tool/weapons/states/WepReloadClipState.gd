extends WeaponState
class_name WepReloadClipState
@export var reloadAnimProperty: String;
@export var idleState: WeaponState

func onStateEnabled():
	super.onStateEnabled()
	if self.manifest.ammoManager.canReload():
		self.manifest.animationTree[reloadAnimProperty] = true
	else:
		self.stateManager.changeState(idleState)

func onReloadAnimFinished():
	self.manifest.ammoManager.reload();
	self.manifest.animationTree[reloadAnimProperty] = false
	self.stateManager.changeState(idleState)
