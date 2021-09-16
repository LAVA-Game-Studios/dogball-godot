extends RigidBody2D
var jump = false

func _process(delta):
	apply_torque_impulse((Input.get_action_strength("walkRight") - Input.get_action_strength("walkLeft")) * 40)
	#apply_torque_impulse(Input.get_axis("walkRight", "walkLeft") * 20) # Preparing for 3.4 (Unstable)
	if self.test_motion(Vector2(0,1)) and Input.is_action_pressed("jump"):
		apply_central_impulse(Vector2(0, -40))
