extends PlayerState
class_name MoveState
@export var friction: float;
@export var actionL: String;
@export var actionR: String;

@export var actionF: String;
@export var actionB: String;

@export var movementLRSpeed: float;
@export var movementFBSpeed: float;
@export var minVelocity: float = 0.1;
@export var stateIdle: String;

var movement:Vector3 = Vector3()
@export var _player: NodePath;
@onready var playerxd = get_node(_player)
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
