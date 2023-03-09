extends Node
class_name Inventory
@export(Array, PackedScene)var items;


func _ready():
	for child in self.get_children():
		item_added(child) #load existing items

func add_child(node, legible_unique_name=false):
	super.add_child(node, legible_unique_name)
	item_added(node)

func item_added(nodeItem):
	var scene = PackedScene.new()
	scene.pack(nodeItem)
	items.push_back(scene)
	self.remove_child(nodeItem)
