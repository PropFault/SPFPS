extends Resource
class_name GameInfo
@export var gamemodeName: String;
@export var currentMap: String;
func _init(json = {"name": "???","currentMap": "???"}):
	self.gamemodeName = json["name"]
	self.currentMap = json["currentMap"]
