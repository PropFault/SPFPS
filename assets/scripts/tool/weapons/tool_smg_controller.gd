extends Node
@export var animationTree: AnimationTree
@export var fireProp: String
@export var reloadProp: String

func _process(delta):
	if Input.is_action_pressed("pFire"):
		animationTree[fireProp] = true
	else:
		animationTree[fireProp] = false
	
