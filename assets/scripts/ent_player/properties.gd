extends Node
@export (NodePath) var _inventory
@export (NodePath) var _toolMgr
@onready var inventory = get_node(_inventory)
@onready var toolMgr:ToolMgr = get_node(_toolMgr)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
