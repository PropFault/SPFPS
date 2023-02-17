extends PlayerState
class_name IdleState

func stateProcessing(delta):
	self.player.velocity.x = 0
	self.player.velocity.z = 0
