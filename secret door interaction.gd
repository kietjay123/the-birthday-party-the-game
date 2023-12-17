extends Sprite


var a = ""
var b = 0
var c = 0
var password = false
signal pdone
onready var d1 = $"digit 1"
onready var d2 = $"digit 2"
onready var d3 = $"digit 3"
onready var d4 = $"digit 4"
onready var d5 = $"digit 5"



func _on_Button1_pressed():
	if b < 5:
		a += "1"
		b += 1
func _on_Button2_pressed():
	if b < 5:
		a += "2"
		b += 1
func _on_Button3_pressed():
	if b < 5:
		a += "3"
		b += 1
func _on_Button4_pressed():
	if b < 5:
		a += "4"
		b += 1
func _on_Button5_pressed():
	if b < 5:
		a += "5"
		b += 1
func _on_Button6_pressed():
	if b < 5:
		a += "6"
		b += 1
func _on_Button7_pressed():
	if b < 5:
		a += "7"
		b += 1
func _on_Button8_pressed():
	if b < 5:
		a += "8"
		b += 1
func _on_Button9_pressed():
	if b < 5:
		a += "9"
		b += 1
func _on_Button0_pressed():
	if b < 5:
		a += "0"
		b += 1




func _on_enter_button_pressed():
	var d = [d1,d2,d3,d4,d5]
	if int(a) == 71258 :
		password = true
	elif int(a) != 71258 :
		password = false
	if a.length() == 5 :
		emit_signal("pdone")
	a = ""
	b = 0
	for i in d :
		i.hide()
	self.hide()
	$"/root/root/play scene/map/big door/Area2D bd".visibility(2)
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1




func _input(_event):
	var d = [d1,d2,d3,d4,d5]
	match b :
		1 : for i in d :
			if i == d1 :
				i.show()
		2 : for i in d :
			if i == d2 :
				i.show()
		3 : for i in d :
			if i == d3 :
				i.show()
		4 : for i in d :
			if i == d4 :
				i.show()
		5 : for i in d :
			if i == d5 :
				i.show()




func _on_button_1_pressed():
	self.hide()
	$"/root/root/play scene/map/big door/Area2D bd".visibility(2)
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
