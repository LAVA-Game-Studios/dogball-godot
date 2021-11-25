extends RigidBody2D
var jump = false

func _process(delta):
	apply_torque_impulse(Input.get_axis("walkLeft", "walkRight") * 20)
	if test_motion(Vector2(0,1)) and not test_motion(Vector2(0,-1)) and Input.is_action_pressed("jump"):
		apply_central_impulse(Vector2(0, -40))
		if not $AudioStreamPlayer.playing:
			$AudioStreamPlayer.play()

func die(_a, _b, _c, _d):
	$AnimationPlayer.play("death")
	$AnimationPlayer.connect("animation_finished", self, 'reset')

func reset(a_):
	get_tree().reload_current_scene()
