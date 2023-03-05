extends State
@export var kick: float = 5.0
@export var maxOvershoot: float = 0.1
@export var reboundTime: float = 2.0
@export var flincher: Node
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
