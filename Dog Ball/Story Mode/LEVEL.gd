extends Node2D
var dogball = preload("res://Story Mode/DOGBALL.tscn")
var dogballInstance = dogball.instance()
var loadNext = null

func _ready():
	add_child(dogballInstance)

func fadeEnd():
	get_tree().change_scene(loadNext)

func fadeIn():
	var modulate = CanvasModulate.new()
	modulate.set_color(Color(0,0,0))
	var tween = Tween.new()
	modulate.add_child(tween)
	add_child(modulate)
	tween.interpolate_property(modulate, "color",
	Color(1,1,1,1), Color(0,0,0,1), 1,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	

func win(body):
	loadNext = "2/LVL.tscn"
	fadeIn()


	
	

