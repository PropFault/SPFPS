extends PlayerState
export(float)var jumpPower;
export(float)var jumpControlDuration;
export(String)var idleState
export(String)var actionJump
export(bool)var keepJumping

var timer = 0.0
func onStateEnabled():
	.onStateEnabled()
	timer = 0.0
	

func _process(delta):
	if self.stateEnabled:
		if not Input.is_action_pressed(actionJump):
			self.stateManager.changeState(idleState)
			print("not Input.is_action_pressed(actionJump)")
		if timer < jumpControlDuration:
			if keepJumping and Input.is_action_pressed(actionJump):
				timer = 0
			else:
				self.player.velocity += Vector3(0,jumpPower/((1+timer/jumpControlDuration)),0)
		else:
			self.stateManager.changeState(idleState)
			print("not timer < jumpControlDuration:")
		timer+= delta
		print(timer)

func onStateDisabled():
	.onStateDisabled()
	timer = 0.0
