extends WeaponState
class_name WepIdleState
@export var pFireState: String
@export var reloadState: String
var initialRun = true
func onStateEnabled():
	super.onStateEnabled()
	initialRun = true
func _process(_delta):
	if self.stateEnabled:
		if Input.is_action_pressed("pFire") and initialRun or Input.is_action_just_pressed("pFire"):
			self.stateManager.changeState(pFireState)
		if Input.is_action_pressed("reload"):
			self.stateManager.changeState(reloadState)
		initialRun = false
