extends PlayerState
class_name MoveState
export(float) var friction;
export(String) var actionL;
export(String) var actionR;

export(String) var actionF;
export(String) var actionB;

export(float) var movementLRSpeed;
export(float) var movementFBSpeed;

var movement:Vector3 = Vector3()

func stateProcessing(delta):
	movement.x= Input.get_action_strength(actionR)-Input.get_action_strength(actionL)
	movement.z= Input.get_action_strength(actionB)-Input.get_action_strength(actionF)
	var newV = self.player.velocity;
	newV += self.player.transform.basis.x * movement.x * movementLRSpeed * delta;
	newV += self.player.transform.basis.z * movement.z * movementFBSpeed * delta;
	newV /= (1 + (friction * friction)*delta);
	
	self.player.velocity = Vector3(newV.x, self.player.velocity.y, newV.z)
