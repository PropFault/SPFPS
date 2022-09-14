extends PlayerState
class_name IdleState
export(float)var idleVelocity;
export(String)var stateMove;
export(String)var stateRun;
export(String)var stateAirborne;
export(String)var stateCrouch;
export(NodePath) var _downcast;
onready var downcast = get_node(_downcast)


func _process(delta):
	var sum = Input.get_action_strength(player.actionL) + Input.get_action_strength(player.actionR) + Input.get_action_strength(player.actionF) +Input.get_action_strength(player.actionB)
	if not player._isGrounded() or Input.is_action_just_pressed(player.actionJump):
		self.stateManager.changeState(stateAirborne)
	if sum > 0:
		if not self.stateManager.isActive(stateAirborne):
			if Input.is_action_pressed(player.actionRun):
				self.stateManager.changeState(stateRun);
			else:
				self.stateManager.changeState(stateMove);
	if self.stateEnabled:
		if(Input.is_action_just_pressed(player.actionCrouch)):
			 self.stateManager.changeState(stateCrouch)
		self.player.velocity.x = 0
		self.player.velocity.z = 0
