extends Node2D

onready var js = get_parent().get_parent().get_node("play scene/Player/the camera/ui/center of controller/joi stick")
onready var default = $"default icon"
onready var uniform = $"uniform icon"
onready var ghost = $"ghost skin icon"
onready var yoga = $"yoga icon"
onready var lp1 = $"lock panel 1"
onready var lp2 = $"lock panel 2"
onready var lp3 = $"lock panel 3"
onready var sp1 = $"select panel 1"
onready var sp2 = $"select panel 2"
onready var sp3 = $"select panel 3"
onready var sp4 = $"select panel 4"
onready var label = $"replay amount"
onready var replay_amount = get_parent().get_parent()
onready var player = get_node("/root/root/play scene/Player")
signal pick_default
signal pick_uniform
signal pick_ghost
signal pick_yoga





func _input(event):
	if self.visible == true :
		if  event is InputEventScreenTouch and event.is_pressed() : 
			var a = event.position.x
			var b = event.position.y
			var c = [sp1,sp2,sp3,sp4]
			if event is InputEventScreenTouch and event.is_pressed() :
				if a >= 90 and a <= 107 and b >= 19 and b <= 71 :
					for i in c :
						if i != sp1 :
							i.hide()
						elif i == sp1 :
							i.show()
					emit_signal("pick_default")
				elif a >= 119 and a <= 136 and b >= 19 and b <= 71 :
					for i in c :
						if i != sp2 :
							i.hide()
						elif i == sp2 :
							i.show()
					emit_signal("pick_uniform")
				elif a >= 148 and a <= 170 and b >= 19 and b <= 71 :
					for i in c :
						if i != sp3 :
							i.hide()
						elif i == sp3 :
							i.show()
					emit_signal("pick_ghost")
				elif a >= 183 and a <= 200 and b >= 19 and b <= 71 :
					for i in c :
						if i != sp4 :
							i.hide()
						elif i == sp4 :
							i.show()
					emit_signal("pick_yoga")




func _on_button_1_pressed():
	self.hide()




func _on_button_2_pressed():
	var c = [sp1,sp2,sp3,sp4]
	for i in c :
		if i.visible == true :
			match i.name :
				"select panel 1" :
					player.skin = "default"
					player.selected_skin()
				"select panel 2" :
					player.skin = "uniform"
					player.selected_skin()
				"select panel 3" :
					player.skin = "ghost skin"
					player.selected_skin()
				"select panel 4" :
					player.skin = "yoga"
					player.selected_skin()
			get_parent().get_node("back ground").pick_skin = true


func _on_inventory_visibility_changed():
	if replay_amount.replay_amount >= 10 :
		lp1.hide()
	if replay_amount.replay_amount >= 25 :
		lp2.hide()
	if replay_amount.replay_amount >= 100 :
		lp3.hide()
