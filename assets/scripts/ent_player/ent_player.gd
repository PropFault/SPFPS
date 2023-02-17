extends KinematicBody
class_name EntPlayer
export(Vector3)var gravity;
export(String) var actionL;
export(String) var actionR;
export(String) var actionF;
export(String) var actionB;
export(String) var actionRun;
export(String) var actionJump;
export(String) var actionCrouch;
export(float) var weight = 70;
onready var mass = weight / gravity.length()
var velocity:Vector3 setget setVelocity, getVelocity;
signal velocityChanged(velocity)
onready var downcast = get_node("Downcast")
onready var propShield = get_node("PropShield")

func setVelocity(var newV):
	velocity = newV;
	emit_signal("velocityChanged",newV);
func getVelocity():
	return velocity
func _ready():
	pass
	
func _physics_process(delta):
	self.velocity = self.move_and_slide(self.velocity,Vector3(0,1,0),false,4,0.785398,true)
	for body in propShield.get_overlapping_bodies():
		if body is RigidBody:
			var space_state = get_world().direct_space_state
			var cast = space_state.intersect_ray(self.global_transform.origin, body.global_transform.origin)
			if cast:
				_process_collision(body, cast.position)
	self.velocity +=gravity*delta

func _process_collision(body, point):
	var ownV = self.velocity
	var colNormal = (self.global_transform.origin - point).normalized()
	var otherPush = ((body.linear_velocity * colNormal) * body.mass)/mass
	self.velocity -= otherPush / mass
	body.apply_impulse(ownV * colNormal * mass, body.global_transform.origin - point)
func _is_grounded():
	return is_on_floor() or downcast.is_colliding()
