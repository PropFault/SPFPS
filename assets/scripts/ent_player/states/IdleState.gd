extends PlayerState
class_name IdleState
export(float)var idleVelocity;
export(String)var stateMove;
export(String)var stateRun;
export(String)var stateJump
export(String) var actionL;
export(String) var actionR;
export(String) var actionF;
export(String) var actionB;
export(String) var actionRun;
export(String) var actionJump;
export(NodePath) var _downcast;
onready var downcast = get_node(_downcast)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var sum = Input.get_action_strength(actionL) + Input.get_action_strength(actionR) + Input.get_action_strength(actionF) +Input.get_action_strength(actionB)
	if Input.is_action_just_pressed(actionJump) and downcast.is_colliding() and not self.stateManager.isActive(stateJump):
		self.stateManager.changeState(stateJump)
		print("switched to jump")
	if sum > 0:
		var currentState = self.stateManager.activeState.stateIdentifier
		if Input.is_action_pressed(actionRun):
			if currentState != stateRun:
				self.stateManager.changeState(stateRun);
		elif not self.stateManager.isActive(stateJump):
			self.stateManager.changeState(stateMove);
	if self.stateEnabled:
		self.player.velocity.x = 0
		self.player.velocity.z = 0
