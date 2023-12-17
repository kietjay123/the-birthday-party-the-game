extends "res://map logic/interactable areas.gd"



onready var store = get_node("/root/root/play scene/Player/the camera/in game store")
onready var player = get_node("/root/root/play scene/Player")



func _ready():
	root.connect("buy", self, "step")
	a.connect("pressed", self, "back")




func step():
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	c.condition("buy")
	yield(c, "cdone")
	store.show()
	match player.skin :
		"default" :
			$"/root/root/play scene/Player/default".hide()
		"uniform" :
			$"/root/root/play scene/Player/uniform".hide()
		"yoga" :
			$"/root/root/play scene/Player/yoga teacher".hide()
		"ghost die" :
			$"/root/root/play scene/Player/ghost die".hide()
		"ghost skin" :
			$"/root/root/play scene/Player/ghost skin".hide()




func back():
	if store.visible == true :
		store.hide()
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
		match player.skin :
			"default" :
				$"/root/root/play scene/Player/default".show()
			"uniform" :
				$"/root/root/play scene/Player/uniform".show()
			"yoga" :
				$"/root/root/play scene/Player/yoga teacher".show()
			"ghost die" :
				$"/root/root/play scene/Player/ghost die".show()
			"ghost skin" :
				$"/root/root/play scene/Player/ghost skin".show()
		root.buttons(2)
