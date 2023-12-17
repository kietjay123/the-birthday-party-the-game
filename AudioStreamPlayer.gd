extends "res://audio.gd"



func _on_button_pressed():
	self.stream = load("res://audio/buttons-001.wav")
	self.play()
