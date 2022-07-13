extends MoveState
export(float) var crouchFactor = 0.5
func _process(delta):
	._process(delta)
	if self.stateEnabled:
		self.player.scale.y = crouchFactor
		if Input.is_key_pressed(KEY_CONTROL):
			self.stateManager.changeState("idle")
	else:
		self.player.scale.y = 1.0
