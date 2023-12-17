extends "res://map logic/interactable areas.gd"



onready var sdi = $"/root/root/play scene/Player/the camera/secret door interaction"
onready var ovsd = $"/root/root/play scene/map/secret door/StaticBody sd"



func _ready():
	root.connect("secret_door", self, "step")




func step():
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	$"/root/root/play scene/map/big door/Area2D bd".visibility(1)
	sdi.show()
	yield(sdi, "pdone")
	$"/root/root/play scene/map/big door/Area2D bd".visibility(2)
	var sdoor = get_node("/root/root/play scene/map/secret door")
	sdoor.play("")
	yield(sdoor, "animation_finished")
	$"/root/root/play scene/map/secret chamber".show()
	$"/root/root/play scene/map/lock pick chest".show()
	get_parent().remove_child($"/root/root/play scene/map/secret door/StaticBody sd")
	sdoor.hide()
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
	root.buttons(2)
	$"/root/root/play scene/Player".secret_door = true
