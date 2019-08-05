extends Spatial

var cam_id = 0


func _input(event):
	
	if Input.is_action_just_pressed("view"): next_cam()
	if Input.is_action_just_pressed("reset"): get_tree().reload_current_scene()


func next_cam():
	cam_id += 1
	if cam_id >= get_tree().get_nodes_in_group("cam").size():
		cam_id = 0
	get_tree().get_nodes_in_group("cam")[cam_id].current = true