extends RigidBody

var tilt_sense = 0.1
var accel_sense = 0.4
var stabilizer = 1

func _process(delta):
	
	var up = get_transform().basis.y.normalized()
	var forward = get_transform().basis.z.normalized()
	var left = get_transform().basis.x.normalized()
	
	#input
	var input_up = Input.get_action_strength("up")+0.6
	apply_central_impulse( up*Input.get_action_strength("up")*accel_sense )
	
	apply_torque_impulse( up*Input.get_action_strength("Left")*accel_sense )
	apply_torque_impulse( -up*Input.get_action_strength("Right")*accel_sense )
	
	apply_torque_impulse( -left*Input.get_action_strength("Up2")*tilt_sense )
	apply_torque_impulse( left*Input.get_action_strength("Down2")*tilt_sense )
	
	apply_torque_impulse( -forward*Input.get_action_strength("Right2")*tilt_sense )
	apply_torque_impulse( forward*Input.get_action_strength("Left2")*tilt_sense )
	
	
	
	if Input.is_action_just_pressed("Boost"): accel_sense = 1
	if Input.is_action_just_released("Boost"): accel_sense = 0.4
	
	if Input.is_action_just_pressed("autopilot"): stabilizer = 0
	if Input.is_action_just_released("autopilot"): stabilizer = 1
	
	#smoothing / autopilot?
	if stabilizer == 1:
		angular_damp = 0.9
		apply_torque_impulse( left*-rotation.x*0.3 )
		apply_torque_impulse( forward*-rotation.z*0.3 )
	
	#feedback
	$Camera/ViewportContainer/Control.display(angular_velocity, linear_velocity, transform, stabilizer==1)