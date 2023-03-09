extends Node
class_name MapManager
var maps:Dictionary;
func _populate_maps(path):

	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin() # TODOGODOT4 fill missing arguments https://github.com/godotengine/godot/pull/40547

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			maps[file.trim_suffix(".tscn")] = path + "/"+ file

	dir.list_dir_end()

func _ready():
	_populate_maps("res://assets/scenes/maps")
	print(maps)

func loadMap(mapSpecifier):
	get_tree().change_scene_to_file(maps.get(mapSpecifier))
