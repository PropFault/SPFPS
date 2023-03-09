extends State
class_name PlayerState
@export var _player_manifest: NodePath
var player_manifest
var player
var inventory
var toolMgr

func _ready():
	player_manifest = get_node(_player_manifest)
	player = player_manifest.player
	inventory = player_manifest.inventory
	toolMgr = player_manifest.tool_mgr
