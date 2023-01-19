extends PlayerState
class_name MoveState
export(float) var friction;
export(String) var actionL;
export(String) var actionR;

export(String) var actionF;
export(String) var actionB;

export(float) var movementLRSpeed;
export(float) var movementFBSpeed;
export(float)var minVelocity = 0.1;
export(String) var stateIdle;

var movement:Vector3 = Vector3()
export(NodePath) var _player;
onready var playerxd = get_node(_player)
func _process(delta):


	if self.stateEnabled:
		movement.x= Input.get_action_strength(actionR)-Input.get_action_strength(actionL)
		movement.z= Input.get_action_strength(actionB)-Input.get_action_strength(actionF)
		#self.player.velocity = Vector3(
		#	self.player.velocity.x * friction + movement.x * delta * movementLRSpeed, 
		#	self.player.velocity.y + movement.y * delta * jumpStrength, 
			#	self.player.velocity.z * friction + movement.z * delta * movementFBSpeed);
		var newV = playerxd.velocity;
		newV += playerxd.transform.basis.x * movement.x * movementLRSpeed * delta;
		newV += playerxd.transform.basis.z * movement.z * movementFBSpeed * delta;
		newV /= (1 + (friction * friction)*delta);
		
		playerxd.velocity = Vector3(newV.x, playerxd.velocity.y, newV.z)

func sigVelocityChanged(velocity):
	if self.stateEnabled and velocity.length() < minVelocity:
		self.stateManager.changeState(stateIdle);
