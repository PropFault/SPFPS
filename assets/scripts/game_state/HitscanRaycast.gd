extends RayCast3D
class_name HitscanRaycast
signal onHit(point,collider, damage)

func fire(dir, length, damage, damageFalloffModifier):
	self.target_position = dir * length
	self.force_raycast_update()
	var point = self.get_collision_point()
	var distance = (point-self.global_transform.origin).length()
	damage = damage/(distance*damageFalloffModifier + 1)
	emit_signal("onHit", point, self.get_collider(), damage)
	
