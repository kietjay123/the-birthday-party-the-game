extends "res://map logic/interactable areas.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	root.connect("dev", self, "step")


func step():
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	if $"/root/root/play scene/Player/the camera/secret door interaction".password == true :
		c.condition("dev")
	else :
		c.condition("secret interaction")
	yield(c, "cdone")
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
