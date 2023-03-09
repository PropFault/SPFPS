extends MoveState
class_name AirborneState
@export var jumpPower: float
@export var jumpControlDuration:float
@export var jumpControllLossMultiplier: float = 2.0;
@export var actionJump: String
@export var keepJumping: bool
var alreadyJumped = false;

var timer = 0.0
func onStateEnabled():
	super.onStateEnabled()
	timer = 0.0

func _process(delta):
	if not Input.is_action_pressed(actionJump):
		alreadyJumped = false
	
func stateProcessing(delta):
	super.stateProcessing(delta)
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
	super.onStateDisabled()
	timer = 0.0

