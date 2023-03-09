extends WepFireState
class_name WepFireHitscanState
@export(PackedScene)var debug
@export(float)var hitscanRange
@export(float)var impactImpulseFac = 10.0
var init = false
func onHit(point, collider, damage):
	print("HIT ", point, " for ", damage)
	var newball = debug.instantiate();
	get_tree().current_scene.add_child(newball);
	newball.global_transform.origin = self.owningTool.raycast.get_collision_point()
	if collider != null:
		if "hp" in collider:
			collider.hp -= damage
		if collider is RigidBody3D:
			var body = collider as RigidBody3D
			body.apply_impulse((self.owningTool.raycast.get_collision_point() - self.owningTool.raycast.global_transform.origin).normalized() * impactImpulseFac, self.owningTool.raycast.get_collision_point() - body.global_transform.origin)


func _fireProjectile(dir):
	if not init:
		self.owningTool.raycast.connect("onHit",Callable(self,"onHit"))
		init = true
	self.owningTool.raycast.fire(dir,500,10, 0.01)

