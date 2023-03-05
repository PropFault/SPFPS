extends Decorator
@export var crouchFactor: float = 0.5

func _process(delta):
	super._process(delta)
	if self.stateEnabled:
		if not Input.is_key_pressed(KEY_CTRL):
			self.stateManager.changeState("idle")

func onStateEnabled():
	super.onStateEnabled()
	self.player.scale.y = crouchFactor
func onStateDisabled():
	super.onStateDisabled()
	#self.player.transform.origin.y -= 0.25
	self.player.scale.y = 1.0
