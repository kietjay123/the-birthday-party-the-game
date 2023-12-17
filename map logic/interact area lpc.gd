extends "res://map logic/interactable areas.gd"



signal take_pick
onready var igi = get_node("/root/root/play scene/Player/the camera/ui/ingame inventory")

 

func _ready():
	root.connect("lock_pick", self, "step")
# warning-ignore:return_value_discarded
	self.connect("take_pick", igi, "_on_take_pick")




func step():
	emit_signal("take_pick")
	root.buttons(2)
