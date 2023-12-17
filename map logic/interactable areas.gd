extends Area2D

 

onready var root = get_parent().get_parent().get_parent().get_parent()
onready var inv = get_node("/root/root/play scene/Player/the camera/ui/ingame inventory")
onready var a = get_node("/root/root/play scene/Player/the camera/ui/button 1")
onready var b = get_node("/root/root/play scene/Player/the camera/ui/button 2")
onready var c = get_node("/root/root/play scene/Player/dialog boxes")
var eitem




func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "steped_on")
# warning-ignore:return_value_discarded
	connect("body_exited", self, "steped_out") 




func steped_on(body):
	var name = body.get_name()
	if name == "Player" :
		item()
		if condition(self.name) == "ok" :
			root.interactable_areas = true
			root.redo_button(1)
			root.buttons(7)
			give_info(true)




func steped_out(body):
	var name = body.get_name()
	if name == "Player" :
		root.interactable_areas = false
		root.redo_button(2)
		give_info(false)




func give_info(x):
	match name :
		"interact area fp" :
			root.interactable["prize"] = x
		"Area2D bd" :
			root.interactable["big door"] = x
		"interact area lpc" :
			root.interactable["lock pick"] = x
		"Area2D sd" :
			root.interactable["secret door"] = x
		"Area2D rb" :
			root.interactable["respawn"] = x
		"buy area" :
			root.interactable["buy"] = x
		"take coin area" :
			root.interactable["take coin"] = x
		"StaticBody si" :
			root.interactable["dev"] = x




func condition(x):
	match x :
		"interact area fp" :
			return "ok"
		"Area2D bd" :
			if $"/root/root/play scene/Player".skin != "ghost die" :
				return "ok"
		"interact area lpc" :
			return "ok"
		"Area2D sd" :
			if eitem == "fake_key" :
				return "ok"
		"Area2D rb" :
			return "ok"
		"buy area" :
			return "ok"
		"take coin area" :
			return "ok"
		"StaticBody si" :
			return "ok"




func item():
	if inv.equipi == null :
		eitem = "no tool"
	else :
		eitem = inv.equipi
