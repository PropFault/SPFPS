extends Node
@export var inventory: Inventory
var equipment;

func _ready():
	self.child_entered_tree.connect(child_added)
	self.child_exiting_tree.connect(child_removed)


func add_equipment(node):
	print("Adding equipment ",  node.name)

func child_added(node):
	add_equipment(node)

func remove_equipment(node):
	print("Removing equipment ", node.name)

func child_removed(node):
	remove_equipment(node)
