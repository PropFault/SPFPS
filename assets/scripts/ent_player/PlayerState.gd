extends State
class_name PlayerState
export(NodePath) var _player_manifest
onready var player_manifest = get_node(_player_manifest)
onready var player = player_manifest.player
onready var inventory = player_manifest.inventory
onready var toolMgr = player_manifest.tool_mgr

