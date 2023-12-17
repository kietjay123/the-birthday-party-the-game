extends "res://audio.gd"

 

var timer = Timer.new()
var amount = 0



func _on_play_button_pressed():
	self.play()




func _on_ingame_music_finished():
	amount += 1
	if amount == 1 :
		timer.wait_time = 10
		add_child(timer)
		timer.set_one_shot(true)
		timer.start()
		timer.connect("timeout", self, "time_out")




func time_out():
	$"/root/root/play scene/Player/sound/ingame music2".play()




func _on_back_ground_visibility_changed():
	var back_gound = $"/root/root/menu/back ground"
	if back_gound.visible == false :
		self.play()
	else :
		stop()
