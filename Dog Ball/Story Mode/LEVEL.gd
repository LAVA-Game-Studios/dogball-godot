extends Node2D
export (int) var level

func fadeEnd(_a, _b):
	get_tree().change_scene('res://Story Mode/' + str(level + 1) + '/LVL.tscn')

func fadeIn(_body):
	var modulate = CanvasModulate.new()
	modulate.set_color(Color(0,0,0))
	var tween = Tween.new()
	modulate.add_child(tween)
	add_child(modulate)
	tween.interpolate_property(modulate, "color",
	Color(1,1,1,1), Color(0,0,0,1), 1,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	tween.connect("tween_completed", self, 'fadeEnd')
	
