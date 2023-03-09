extends PlayerState
class_name MoveState
@export var friction: float;
@export var actionL: String;
@export var actionR: String;

@export var actionF: String;
@export var actionB: String;

@export var movementLRSpeed: float;
@export var movementFBSpeed: float;
var movement:Vector3 = Vector3()

func stateProcessing(delta):
	movement.x= Input.get_action_strength(actionR)-Input.get_action_strength(actionL)
	movement.z= Input.get_action_strength(actionB)-Input.get_action_strength(actionF)
	var newV = self.player.velocity;
	newV += self.player.transform.basis.x * movement.x * movementLRSpeed * delta;
	newV += self.player.transform.basis.z * movement.z * movementFBSpeed * delta;
	newV /= (1 + (friction * friction)*delta);
	
	self.player.velocity = Vector3(newV.x, self.player.velocity.y, newV.z)
