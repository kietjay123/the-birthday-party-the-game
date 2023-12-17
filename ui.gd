extends Sprite



onready var camera = get_parent()
onready var player = $"/root/root/play scene/Player"
onready var moving = get_node("center of controller/joi stick")
onready var dbox = $"/root/root/play scene/Player/dialog boxes"



func _process(_delta):
	var cam_pos = camera.global_position
	if moving.moving_character == 1 :
		dbox.set_global_position(camera.get_camera_screen_center() + Vector2(20, 0.5))
		if cam_pos.x <= 0 :
			camera.drag_margin_left = 0.46
			camera.drag_margin_right = 0
			self.position.x = 0 - cam_pos.x
		elif cam_pos.x >= 804 :
			camera.drag_margin_right = 0.95
			camera.drag_margin_left = 0
			self.position.x = 804 - cam_pos.x
		else :
			camera.drag_margin_left = 0
			camera.drag_margin_right = 0
			self.position.x = 0 
		if cam_pos.y <= 46 :
			camera.drag_margin_top = 0.66
			camera.drag_margin_bottom = 0
			self.position.y = 46 - cam_pos.y
		elif cam_pos.y >= 345 :
			camera.drag_margin_bottom = 0.68
			camera.drag_margin_top = 0
			self.position.y = 345 - cam_pos.y
		else :
			camera.drag_margin_top = 0
			camera.drag_margin_bottom = 0
			self.position.y = 0




func _ready():
	dbox.set_global_position(camera.get_camera_screen_center() + Vector2(20, 0.5))
