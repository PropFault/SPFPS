extends PlayerState
class_name IdleState
@export var idleVelocity: float;
@export var stateMove: String;
@export var stateRun: String;
@export var stateAirborne: String;
@export var actionL: String;
@export var actionR: String;
@export var actionF: String;
@export var actionB: String;
@export var actionRun: String;
@export var actionJump: String;
@export var _player: NodePath;
@export var stateCrouch: String;
@export var _downcast: NodePath;



func _process(delta):
	var sum = Input.get_action_strength(self.player.actionL) + Input.get_action_strength(self.player.actionR) + Input.get_action_strength(self.player.actionF) +Input.get_action_strength(self.player.actionB)
	if not self.player._isGrounded() or Input.is_action_just_pressed(self.player.actionJump):
		self.stateManager.changeState(stateAirborne)
	if sum > 0:
		if not self.stateManager.isActive(stateAirborne):
			if Input.is_action_pressed(self.player.actionRun):
				self.stateManager.changeState(stateRun);
			else:
				self.stateManager.changeState(stateMove);
	if self.stateEnabled:
		if(Input.is_action_just_pressed(self.player.actionCrouch)):
			self.stateManager.changeState(stateCrouch)
		self.player.velocity.x = 0
		self.player.velocity.z = 0
