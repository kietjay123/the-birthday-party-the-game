extends Area2D



onready var player = $"/root/root/play scene/Player"



func _on_Area2D_gssp_body_entered(body):
	if body.name == "Player" :
		player.changeable_direction = [Vector2(9,-14), Vector2(-9,14)]
		if player.global_position.y < 330 :
			$"/root/root/play scene/map/ghost skin special path".show()
			$"/root/root/play scene/map/spike chamber".show()
			$"/root/root/play scene/map/wall 19".show()


func _on_Area2D_gssp_body_exited(body):
	if body.name == "Player" :
		player.changeable_direction = [Vector2(1,-0.5), Vector2(-1,0.5)]
		if player.global_position.y < 330 :
			$"/root/root/play scene/map/ghost skin special path".hide()
			$"/root/root/play scene/map/spike chamber".hide()
			$"/root/root/play scene/map/wall 19".hide()
