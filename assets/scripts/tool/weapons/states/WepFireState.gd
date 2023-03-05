extends WeaponState
class_name WepFireState
@export var primaryFirePattern: Texture2D
@export var idleState: String;
@export var animSpeedProperty: String;
@export var fireAnimLength: float;
@export var fullAuto: bool = false;
@export var RPS: float = 10.0
@export var animPropFirePrimary: String
@export var spread: float = 0.3
var firePattern:Dictionary
var firePatternIndex = 0
var finished = true
var timer = 9999
func _ready():
	generateFirePattern()

func onStateEnabled():
	super.onStateEnabled()
	self.fire()
	
func fire():
	timer = 0
	print("FIRE CALLED")
	if self.ammoManager.canSpendBullets():
		self.animationTree[animSpeedProperty] = RPS*fireAnimLength
		self.animationTree[animPropFirePrimary]=true
		finished = false
		self.ammoManager.spendBullets()
		self._fireProjectile((Vector3(firePattern.values()[firePatternIndex].x*spread,firePattern.values()[firePatternIndex].y*spread,1)).normalized())
		firePatternIndex = (firePatternIndex+1) % firePattern.size()
	else:
		self.stateManager.changeState(idleState)
func _process(delta):
	if self.stateEnabled:
		if (not Input.is_action_pressed("pFire")) and finished:
			self.stateManager.changeState(idleState)
		else:
			if finished and timer >= 1/RPS:
				fire()
		timer += delta
	
func _fireProjectile(direction):
	pass
func fireAnimationFinished():
	print("FINISH CALLED")
	finished=true


	self.animationTree[animPropFirePrimary]=false
	if not (fullAuto and Input.is_action_pressed("pFire")):
		self.stateManager.changeState(idleState)

func generateFirePattern():
	firePattern.clear()
	var image = primaryFirePattern.get_data()
	false # image.lock() # TODOConverter40, Image no longer requires locking, `false` helps to not break one line if/else, so it can freely be removed
	var imageSize = image.get_size()
	var sortHelper = Array()
	var tempDic = Dictionary()
	for x in range(0, imageSize.x):
		for y in range (0, imageSize.y):
			var color = image.get_pixel(x,y)
			var bgr = color.to_abgr32()
			var xRel = (x/imageSize.x)*2-1
			var yRel = (y/imageSize.y)*2-1
			tempDic[bgr] = Vector3(-xRel,-yRel,1).normalized();
			sortHelper.push_back(bgr);
	sortHelper.sort();
	for elem in sortHelper:
		firePattern[elem] = tempDic[elem];
func onStateDisabled():
	super.onStateDisabled()
	finished = true
	if fullAuto:
		firePatternIndex = 0
	timer = 999
	self.animationTree[animSpeedProperty] = 1
