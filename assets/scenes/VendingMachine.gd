extends RigidBody3D

@export var animator: AnimationPlayer
@export var hp: float  = 100.0 : get = getHP, set = setHP
@export var canSpawn: Node3D
@export var can: PackedScene
@export var throwingForce: float = 10.0
func setHP(nhp):
	if(nhp < hp and can != null):
		var i = can.instantiate()
		i.global_transform.origin = (canSpawn.global_transform.origin)
		i.apply_central_impulse (canSpawn.global_transform.basis.z * throwingForce)
		get_tree().get_root().add_child(i)
	hp = nhp
	if(hp < 0):
		animator.playback_speed = 1

func getHP():
	return hp
