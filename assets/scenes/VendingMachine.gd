extends RigidBody
export(NodePath)var _animator
onready var animator = get_node(_animator)
export(float) var hp  = 100 setget setHP, getHP
onready var canSpawn = get_node("CanSpawn")
export(String, FILE, "*.tscn") var _can
onready var can = load(_can)
export(float) var throwingForce = 10
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


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
	#if not get_tree().is_network_server():
	#	self.sleeping = true
	#	Game.connect("KeyframePassed", self, "vendingUPD")

#func vendingUPD(actionJSON):
#	var action = Game.Action.new(actionJSON)
#	if action.name == "SODAUPD" and action.args["name"] == self.name:
#		self.global_transform.origin = action.args["pos"]
#		self.rotation_degrees = action.args["rot"]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	if not get_tree().is_network_server():
#		self.sleeping = true
#	else:
#		Game.addKeyframe(Game.Action.new({Game.Action.JSON_TICK: Game.tick, Game.Action.JSON_NAME: "SODAUPD", Game.Action.JSON_ARGS: {"pos": self.global_transform.origin, "rot": self.rotation_degrees, "name": self.name}}))
##		self.add_force(Vector3(10*delta,0,0), Vector3(0,0,0))
