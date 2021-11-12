extends PlayerState
class_name IdleState
export(float)var idleVelocity;
export(String)var stateMove;
export(String)var stateRun;
export(String)var stateAirborne;
export(String) var actionL;
export(String) var actionR;
export(String) var actionF;
export(String) var actionB;
export(String) var actionRun;
export(String) var actionJump;
export(NodePath) var _downcast;
onready var downcast = get_node(_downcast)

func _isGrounded():
	return player.is_on_floor() or downcast.is_colliding()

func _process(delta):
	var sum = Input.get_action_strength(actionL) + Input.get_action_strength(actionR) + Input.get_action_strength(actionF) +Input.get_action_strength(actionB)
	if not _isGrounded() or Input.is_action_just_pressed("plr_jump"):
		self.stateManager.changeState(stateAirborne)
	if sum > 0:
		if not self.stateManager.isActive(stateAirborne):
			if Input.is_action_pressed(actionRun):
				self.stateManager.changeState(stateRun);
			else:
				self.stateManager.changeState(stateMove);
	if self.stateEnabled:
		self.player.velocity.x = 0
		self.player.velocity.z = 0
