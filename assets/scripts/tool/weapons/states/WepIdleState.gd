extends WeaponState
class_name WepIdleState
export (NodePath)var pFireState
export (NodePath)var reloadState
var initialRun = true
func onStateEnabled():
	.onStateEnabled()
	initialRun = true
func _process(_delta):
	if self.stateEnabled:
		if Input.is_action_pressed("pFire") and initialRun or Input.is_action_just_pressed("pFire"):
			self.stateManager.changeState(pFireState)
		if Input.is_action_pressed("reload"):
			self.stateManager.changeState(reloadState)
		initialRun = false
