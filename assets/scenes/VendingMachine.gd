extends RigidBody
export(NodePath)var _animator
onready var animator = get_node(_animator)
export(float) var hp  = 100.0 setget setHP, getHP
onready var canSpawn = get_node("CanSpawn")
export(String, FILE, "*.tscn") var _can
onready var can = load(_can)
export(float) var throwingForce = 10.0
func setHP(nhp):
	if(nhp < hp and can != null):
		var i = can.instance()
		i.global_transform.origin = (canSpawn.global_transform.origin)
		i.apply_central_impulse (canSpawn.global_transform.basis.z * throwingForce)
		get_tree().get_root().add_child(i)
	hp = nhp
	if(hp < 0):
		animator.playback_speed = 1

func getHP():
	return hp
