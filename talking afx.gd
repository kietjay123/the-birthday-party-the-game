extends "res://audio.gd"



func _on_dialog_boxes_start():
	self.stream = load("res://audio/talking.wav")
	self.play()
