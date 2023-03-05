extends Control


func _on_Connect_pressed():
	Networking.startClient()



#func _on_Host_pressed():
#	var array = ["--no-window", "--server"]
#	var args = PackedStringArray(array)
#	var exe = "./bin/game.exe"
#	if not File.new().file_exists(exe):
#		exe = OS.get_executable_path()
#	OS.execute(exe, args, false)
