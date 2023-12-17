extends "res://map logic/interactable areas.gd"



func _ready():
	root.connect("take_coin", self, "step")




func step():
	var _shop_profit = get_node("/root/root/play scene/Player/the camera/in game store").shop_profit
	var rp = get_node("/root/root/play scene/Player/the camera/in game store")
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	c.condition("take")
	yield(c, "cdone")
	rp.coin_count("steal")
	$"/root/root/play scene/Player/the camera/in game store".shop_profit = 0
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
	root.buttons(2)
