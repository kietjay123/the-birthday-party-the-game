extends Area2D


onready var door = $"/root/root/play scene/map/big door/Area2D bd"



func _on_Area_disapear_body_entered(body):
	var name = body.get_name()
	if name == "Player" :
		door.visibility(1)


func _on_Area_disapear_body_exited(body):
	var name = body.get_name()
	if name == "Player" :
		door.visibility(2)
