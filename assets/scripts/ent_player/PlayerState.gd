extends State
class_name PlayerState
@export var player_manifest: PlayerManifest
@onready var player = player_manifest.player
@onready var inventory = player_manifest.inventory
@onready var toolMgr = player_manifest.tool_mgr

