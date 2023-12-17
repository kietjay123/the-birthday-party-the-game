extends Area2D



func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "on_body_entered")
# warning-ignore:return_value_discarded
	connect("body_exited", self, "on_body_exited")



func on_body_entered(body):
	var name = body.get_name()
	if name == "Player" :
		get_parent().hide()




func on_body_exited(body):
	var name = body.get_name()
	if name == "Player" :
		get_parent().show()
