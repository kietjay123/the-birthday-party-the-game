extends Node2D

onready var pick = $"lock pick pick"
onready var rench = $"tension rench"
onready var p1 = $"upin1 "
onready var p2 = $"upin2"
onready var p3 = $"upin3"
onready var p4 = $"upin4"
onready var p5 = $"upin5"
onready var dp1 = $"dpin1"
onready var dp2 = $"dpin2"
onready var dp3 = $"dpin3"
onready var dp4 = $"dpin4"
onready var dp5 = $"dpin5"
var up = 0
var right = 0
var left = 0
var down = 0
var current_pos = Vector2(0,0)
var p1_pos = 3
var p2_pos = 2
var p3_pos = 3
var p4_pos = 1
var p5_pos = 4
var pickable = false
var binding_order = [3,1,5,2,4]
var pins_ypos_from_pick = [0,0,0,0,0]
var pin_above_pick 
var pos_of_pab
var dp_above_pick
var pos_of_dpab
var tension = false




func _on_joi_stick_move_up():
	if current_pos.x >= 2 and current_pos.y > -4 :
		current_pos.y -= 1
		up = 1
func _on_joi_stick_move_right():
	if current_pos.x < 6 and current_pos.y == 0 :
		current_pos.x += 1
		right = 1
func _on_joi_stick_move_left():
	if current_pos.x > 0 and current_pos.y == 0 :
		current_pos.x -= 1
		left = 1
func _on_joi_stick_move_down():
	if current_pos.x >= 2 and current_pos.y < 0 :
		current_pos.y += 1
		down = 1




func _process(_delta):
	var pins = [p1,p2,p3,p4,p5]
	var dps = [dp1,dp2,dp3,dp4,dp5]
	var pins_pos = [p1_pos,p2_pos,p3_pos,p4_pos,p5_pos]
	if current_pos.x < 2 :
		if right == 1 :
			pick.set_position(Vector2(pick.position.x + 4 , pick.position.y ))
			right = 0
		elif left == 1 :
			pick.set_position(Vector2(pick.position.x - 4 , pick.position.y ))
			left = 0 
	elif current_pos.x >= 2 and current_pos.x <= 6 :
		pin_above_pick = pins[int(current_pos.x) - 2] 
		dp_above_pick = dps[int(current_pos.x) - 2]
		pos_of_pab = pins_pos[int(current_pos.x) - 2]
		if up == 1 : 
			up = 0 
		elif down == 1 :
			pick.set_position(Vector2(pick.position.x , pick.position.y + 1))
			down = 0
		elif right == 1 :
			pick.set_position(Vector2(pick.position.x + 4 , pick.position.y ))
			right = 0
		elif left == 1 :
			pick.set_position(Vector2(pick.position.x - 4 , pick.position.y ))
			left = 0 
	if p1_pos == 0 and p2_pos == 0 and p3_pos == 0 and p4_pos == 0 and p5_pos == 0 :
		pickable = true





func _on_button_2_pressed():
	if tension == false :
		tension = true
		rench.play("apply tension", true)
	else :
		tension = false
		rench.play("apply tension", false)
		#add reset vfx




func _on_button_1_pressed():
	self.hide()
	get_node("/root/root/play scene/Player/the camera/opacity layer (filter1)").hide()
	#reset pin




func _on_tr_button_pressed():
	if pickable == true :
		 rench.play("done", false)
	elif pickable == false :
		rench.play("gigle", false)
		yield(rench, "animation_finished")
		rench.play("gigle", false)
