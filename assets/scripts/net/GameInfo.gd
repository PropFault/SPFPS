extends Resource
class_name GameInfo
@export(String)var gamemodeName;
@export(String)var currentMap;
func _init(json = {"name": "???","currentMap": "???"}):
	self.gamemodeName = json["name"]
	self.currentMap = json["currentMap"]

func JSON.new().stringify():
	return { "name": self.gamemodeName, "currentMap": self.currentMap}
