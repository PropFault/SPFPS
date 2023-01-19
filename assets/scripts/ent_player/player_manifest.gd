extends Node
export(NodePath) var _player
export(NodePath) var _inventory
export(NodePath) var _tool_mgr

onready var player = get_node(_player)
onready var inventory = get_node(_inventory)
onready var tool_mgr = get_node(_tool_mgr)
