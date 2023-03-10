extends WeaponState
class_name WepReloadClipState

func onReloadAnimFinished():
	self.manifest.ammoManager.reload();
