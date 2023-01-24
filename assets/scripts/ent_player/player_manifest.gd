extends Node
export(NodePath) var _player
export(NodePath) var _inventory
export(NodePath) var _tool_mgr

var player
var inventory
var tool_mgr

func _ready():
	player = get_node(_player)
	inventory = get_node(_inventory)
	tool_mgr = get_node(_tool_mgr)
