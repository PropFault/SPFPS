extends MoveState
class_name AirborneState
@export var jumpPower : float;
@export var jumpControlDuration : float;
@export var actionJump : String;
@export var keepJumping : bool;

var timer = 0.0
func onStateEnabled():
	super.onStateEnabled()
	timer = 0.0
	

func _process(delta):
	super._process(delta)
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
	super.onStateDisabled()
	timer = 0.0
