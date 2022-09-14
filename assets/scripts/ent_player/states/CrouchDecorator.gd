extends Decorator
export(float) var crouchFactor = 0.5
onready
func _process(delta):
	._process(delta)
	if self.stateEnabled:
		if not Input.is_key_pressed(KEY_CONTROL):
			self.stateManager.changeState("idle")

func onStateEnabled():
	.onStateEnabled()
	self.player.scale.y = crouchFactor
func onStateDisabled():
	.onStateDisabled()
	#self.player.transform.origin.y -= 0.25
	self.player.scale.y = 1.0
