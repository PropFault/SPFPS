extends MoveState
export(float)var jumpPower;
export(float)var jumpControlDuration;
export(String)var actionJump;
export(bool)var keepJumping;

var timer = 0.0
func onStateEnabled():
	.onStateEnabled()
	timer = 0.0
	

func _process(delta):
	._process(delta)
	if Input.is_action_pressed(actionJump):
		if timer < jumpControlDuration:
			if keepJumping:
				timer = 0
			else:
				playerxd.velocity += Vector3(0,jumpPower/((1+timer/jumpControlDuration)),0)
		if self.stateEnabled:
			timer+= delta
			print(timer)
	if playerxd._isGrounded() and self.stateEnabled:
		self.stateManager.changeState(self.stateIdle);


func onStateDisabled():
	.onStateDisabled()
	timer = 0.0
