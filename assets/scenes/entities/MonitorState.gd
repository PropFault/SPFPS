extends State


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.stateEnabled:
		if Input.is_key_pressed(KEY_C):
			self.stateManager.changeState("flinch")
