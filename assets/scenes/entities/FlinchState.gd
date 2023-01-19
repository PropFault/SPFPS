extends State
export(float) var kick = 5.0
export(float) var maxOvershoot = 0.1
export(float) var reboundTime = 2.0
export(NodePath) var _flincher
onready var flincher = get_node(_flincher)
var x = 0.0
var reachFirstZero = 2.5 * PI
func xScale(x):
	return reachFirstZero * (x/reboundTime)
	
func kickFunc(x):
	var sx = xScale(x)
	return maxOvershoot + (cos(sx) + 1) * (kick - maxOvershoot)/(2 + x)

func _process(delta):
	if self.stateEnabled:
		var kickVal = kickFunc(x)
		if(x > reboundTime):
			changeState()
		flincher.rotation_degrees.x = kickVal
		x = x + delta
		print(kickVal)
		
		
func changeState():
	x = 0.0
	self.stateManager.changeState("idle")
