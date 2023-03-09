extends Node
@export var _player: NodePath
@export var _inventory: NodePath
@export var _tool_mgr: NodePath

var player
var inventory
var tool_mgr

func _ready():
	player = get_node(_player)
	inventory = get_node(_inventory)
	tool_mgr = get_node(_tool_mgr)
