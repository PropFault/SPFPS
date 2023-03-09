extends CharacterBody3D
class_name EntPlayer
@export(Vector3)var gravity;
@export var actionL: String;
@export var actionR: String;
@export var actionF: String;
@export var actionB: String;
@export var actionRun: String;
@export var actionJump: String;
@export var actionCrouch: String;
@export var weight: float = 70;
@onready var mass = weight / gravity.length()
var velocity:Vector3 : get = getVelocity, set = setVelocity;
signal velocityChanged(velocity)
@onready var downcast = get_node("Downcast")
@onready var propShield = get_node("PropShield")

func setVelocity(newV):
	velocity = newV;
	emit_signal("velocityChanged",newV);
func getVelocity():
	return velocity
func _ready():
	pass
	
func _physics_process(delta):
	self.set_velocity(self.velocity)
	self.set_up_direction(Vector3(0,1,0))
	self.set_floor_stop_on_slope_enabled(false)
	self.set_max_slides(4)
	self.set_floor_max_angle(0.785398)
	# TODOConverter40 infinite_inertia were removed in Godot 4.0 - previous value `true`
	self.move_and_slide()
	self.velocity = self.velocity
	for body in propShield.get_overlapping_bodies():
		if body is RigidBody3D:
			var space_state = get_world_3d().direct_space_state
			var cast = space_state.intersect_ray(self.global_transform.origin, body.global_transform.origin)
			if cast:
				_process_collision(body, cast.position)
	self.velocity +=gravity*delta

func _process_collision(body, point):
	var ownV = self.velocity
	var colNormal = (self.global_transform.origin - point).normalized()
	var otherPush = ((body.linear_velocity * colNormal) * body.mass)/mass
	self.velocity -= otherPush / mass
	body.apply_impulse(body.global_transform.origin - point, ownV * colNormal * mass)
func _is_grounded():
	return is_on_floor() or downcast.is_colliding()
