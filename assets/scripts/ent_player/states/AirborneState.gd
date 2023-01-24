extends MoveState
class_name AirborneState
export(float)var jumpPower;
export(float)var jumpControlDuration;
export(String)var actionJump;
export(bool)var keepJumping;

var timer = 0.0
func onStateEnabled():
	.onStateEnabled()
	timer = 0.0
	
func stateProcessing(delta):
	.stateProcessing(delta)
	if Input.is_action_pressed(actionJump):
		if timer < jumpControlDuration:
			if keepJumping:
				timer = 0
			else:
				self.player.velocity += Vector3(0,jumpPower/((1+timer/jumpControlDuration)),0)
	timer+= delta
	print(timer)

func onStateDisabled():
	.onStateDisabled()
	timer = 0.0
