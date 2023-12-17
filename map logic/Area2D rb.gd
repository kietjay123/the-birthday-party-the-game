extends "res://map logic/interactable areas.gd"



func _ready():
	root.connect("respawn", self, "step")




func step():
	var _d_sign = $"/root/root/play scene/Player/the camera/notification sign/respawn sign"
	var player = $"/root/root/play scene/Player"
	var _filter1 = $"/root/root/play scene/Player/the camera/opacity layer (filter1)"
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	c.condition("respawn")
	yield(c, "cdone")
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
	if player.skin == "ghost die" :
		#d_sign.show()
		#filter1.show()
		#root.redo_button(1)
		#root.buttons(1)
		player.skin = player.preskin
		player.selected_skin()
		#yield(b, "pressed")
		#d_sign.hide()
		#filter1.hide()
		#root.buttons(2)
		#FIX LATER
