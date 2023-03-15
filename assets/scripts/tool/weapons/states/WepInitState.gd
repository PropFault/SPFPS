extends WeaponState
class_name WepInitState
@export var idleState: WeaponState

func _ready():
	self.stateManager.changeState(self)

func animInitDone():
	self.stateManager.changeState(idleState)
