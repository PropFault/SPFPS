extends CharacterBody3D
class_name EntPlayer
@export var gravity: Vector3;
@export var actionL: String;
@export var actionR: String;
@export var actionF: String;
@export var actionB: String;
@export var actionRun: String;
@export var actionJump: String;
@export var actionCrouch: String;
@export var weight: float = 70;
@export var downcast: RayCast3D
@export var propShield: Area3D
@onready var mass = weight / gravity.length()
signal velocityChanged(velocity)


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
	self.move_and_slide()
	for i in range(0, self.get_slide_collision_count()):
		var col = self.get_slide_collision(i)
		if col.get_collider() is RigidBody3D:
			_process_collision(col.get_collider(),col.get_collider_velocity(),col.get_normal(),col.get_position())
	self.velocity = self.velocity
	#for body in propShield.get_overlapping_bodies():
	#	if body is RigidBody3D:
	#		var space_state = get_world_3d().direct_space_state
	#		var ray = PhysicsRayQueryParameters3D.create(self.global_transform.origin, body.global_transform.origin)
	#		var cast = space_state.intersect_ray(ray)
	#		if cast:
	#			_process_collision(body, cast.position, delta)
	self.velocity +=gravity*delta

func _process_collision(body, colVelo, colNormal, point):
	var ownV = self.velocity
	var otherPush = ((colVelo * colNormal) * body.mass)/mass
	self.velocity -= otherPush
	body.apply_impulse(ownV * -colNormal * mass, point)

func _is_grounded():
	return is_on_floor() or downcast.is_colliding()
