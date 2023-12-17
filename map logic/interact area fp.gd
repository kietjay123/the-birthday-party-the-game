extends "res://map logic/interactable areas.gd"



onready var win_sign = get_node("/root/root/play scene/Player/the camera/notification sign/win sign")
onready var sm = get_node("/root/root/play scene/Player/the camera/ui/setting menu")
onready var borrow = $"/root/root/play scene/map/big door/Area2D bd"
onready var blackbg = $"/root/root/play scene/Player/the camera/opacity layer (filter1)"




func _ready():
	root.connect("prize", self, "step")
	a.connect("pressed", self, "back")




func step():
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	c.condition("end")
	yield(c, "cdone")
	borrow.visibility(1)
	win_sign.show()
	blackbg.show()




func back():
	win_sign.hide()
	blackbg.hide()
	borrow.visibility(2)
	root.buttons(2)
	root.replay_amount += 1
	root.save()
	print(root.replay_amount)
	sm._on_quit_pressed()
