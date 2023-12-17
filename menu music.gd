extends "res://audio.gd"



func _on_back_ground_visibility_changed():
	var back_gound = $"/root/root/menu/back ground"
	if back_gound.visible == false :
		stop()
	else :
		play()




func _ready():
	_on_back_ground_visibility_changed()
