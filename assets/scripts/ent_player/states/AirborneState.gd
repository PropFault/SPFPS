extends MoveState
class_name AirborneState
export(float)var jumpPower;
export(float)var jumpControlDuration;
export(float)var jumpControllLossMultiplier = 2.0;
export(String)var actionJump;
export(bool)var keepJumping;
var alreadyJumped = false;

var timer = 0.0
func onStateEnabled():
	.onStateEnabled()
	timer = 0.0

func _process(delta):
	if not Input.is_action_pressed(actionJump):
		alreadyJumped = false
	
func stateProcessing(delta):
	.stateProcessing(delta)
	print("TIMER: ", timer)
	var canJump = timer < jumpControlDuration and not alreadyJumped
	if Input.is_action_pressed(actionJump):
		if canJump:
			if keepJumping:
				timer = 0
			else:
				self.player.velocity += Vector3(0,jumpPower/((1+(timer/jumpControlDuration)*jumpControllLossMultiplier)),0)
		else:
			alreadyJumped = true;
	timer+= delta


func onStateDisabled():
	.onStateDisabled()
	timer = 0.0

