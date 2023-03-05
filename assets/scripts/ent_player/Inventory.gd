extends Node
class_name Inventory
@export var items: Array[PackedScene];


func _ready():
	for child in self.get_children():
		item_added(child) #load existing items
	self.child_entered_tree.connect(child_added)
	self.child_exiting_tree.connect(child_removed)

func child_added(node):
	item_added(node)
	
func child_removed(node):
	pass

func item_added(nodeItem):
	var scene = PackedScene.new()
	scene.pack(nodeItem)
	items.push_back(scene)
	self.remove_child(nodeItem)
