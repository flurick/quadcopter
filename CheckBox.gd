extends Button


func _on_CheckBox_pressed():
	print("--",pressed)
	AudioServer.set_bus_mute(0, pressed)