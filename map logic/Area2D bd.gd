extends "res://map logic/interactable areas.gd"



onready var plscene = get_node("/root/root/play scene/Player/the camera/lock pick scene")
onready var op_layer = get_node("/root/root/play scene/Player/the camera/opacity layer (filter1)")
onready var player = get_node("/root/root/play scene/Player")
onready var blackbg = $"/root/root/play scene/Player/the camera/opacity layer (filter1)"
onready var textb = $"/root/root/play scene/Player/temporarely fix"
onready var ovgp = $"/root/root/play scene/map/ghost skin special path/StaticBody sksp/CollisionShape sp7"
onready var ovbd = $"/root/root/play scene/map/big door/StaticBody bd"
var z



func _ready():
	root.connect("big_door", self, "step")
	a.connect("pressed", self, "back")
	b.connect("pressed", self, "revive")
	




func step():
	$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 0
	var move = Tween.new()
	move.set_name("move")
	self.add_child(move)
	move.interpolate_property(player, "position", player.position, Vector2(504,231), 0.5, Tween.TRANS_LINEAR)
	move.start()
	yield(move, "tween_completed")
	if eitem == "no tool" :
		c.condition("no tool")
		yield(c, "cdone")
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
	elif eitem == "fake_key" :
		c.condition("fake key")
		yield(c, "cdone")
		var trap = get_node("/root/root/play scene/map/trap door")
		var fall = Tween.new()
		fall.set_name("fall")
		self.add_child(fall)
		fall.interpolate_property(player, "position", player.position, Vector2(504,386), 0.75, Tween.TRANS_LINEAR, Tween.EASE_IN)
		fall.connect("tween_completed", self, "dead")
		trap.play("")
		yield(trap, "animation_finished")
		$"/root/root/play scene/map/spike chamber".show()
		$"/root/root/play scene/map/wall 19".show()
		$"/root/root/play scene/map/interactive floor".hide()
		fall.start()
		yield(fall, "tween_completed")
		$"/root/root/play scene/map/interactive floor".show()
		$"/root/root/play scene/map/trap door".stop()
		$"/root/root/play scene/map/trap door".set_frame(0)
		if player.skin != "ghost skin" :
			player.animation_player.play("die pit")
			yield(player.animation_player, "animation_finished")
			visibility(1)
			dead()
		else :
			c.condition("die")
			yield(c,"cdone")
			$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
			$"/root/root/play scene/map/ghost skin special path".show()
			$"/root/root/play scene/map/ghost skin special path/StaticBody sksp/CollisionShape sp7".get_parent().remove_child($"/root/root/play scene/map/ghost skin special path/StaticBody sksp/CollisionShape sp7")
	elif eitem == "real_key" :
		if $"/root/root/play scene/map/big door".get_frame() != 9 :
			c.condition("real key")
			yield(c, "cdone")
			var door = get_node("/root/root/play scene/map/big door")
			door.play("")
			yield(door, "animation_finished")
			$"/root/root/play scene/map/big door/StaticBody bd".get_parent().remove_child($"/root/root/play scene/map/big door/StaticBody bd")
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
		root.buttons(2)
	elif eitem == "pick" :
		if $"/root/root/play scene/map/big door".get_frame() != 9 :
			c.condition("pick")
			yield(c, "cdone")
			var door = get_node("/root/root/play scene/map/big door")
			door.play("")
			yield(door, "animation_finished")
			$"/root/root/play scene/map/big door/StaticBody bd".get_parent().remove_child($"/root/root/play scene/map/big door/StaticBody bd")
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
	elif eitem == "club" :
		videom("club")
		c.condition("door stick")
		yield(c, "cdone")
		visibility(1)
		print(z)
		textb.show()
		textb.stream = z
		textb.play()
		yield(textb, "finished")
		root.buttons(4)
		yield(a, "pressed")
		textb.hide()
		dead()
	elif eitem == "sword" :
		videom("sword")
		c.condition("door sword")
		yield(c,"cdone")
		visibility(1)
		textb.stream = z
		textb.play()
		yield(textb, "finished")
		root.buttons(4)
		yield(a, "pressed")
		textb.hide()
		dead()
	elif eitem == "pistol" :
		videom("gun")
		c.condition("door gun")
		yield(c, "cdone")
		visibility(1)
		textb.stream = z
		textb.play()
		yield(textb, "finished")
		root.buttons(4)
		yield(a, "pressed")
		textb.hide()
		dead()




func back():
	if plscene.visible == true :
		plscene.hide()
		op_layer.hide()
		visibility(2)
		root.buttons(2)
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1




func dead():
	$"/root/root/play scene/map/spike chamber/StaticBody sc/CollisionShape sc2".show()
	$"/root/root/play scene/map/spike chamber/StaticBody sc/CollisionShape sc1".show()
	if player.skin != "ghost skin" :
		var dead_sign = get_node("/root/root/play scene/Player/the camera/notification sign/die sign")
		blackbg.show()
		dead_sign.show()




func revive():
	if get_node("/root/root/play scene/Player/the camera/notification sign/die sign").visible == true :
		player.set_global_position(Vector2(504,231))
		blackbg.hide()
		$"/root/root/play scene/Player/the camera/notification sign/die sign".hide()
		visibility(2)
		player.skin = "ghost die"
		player.selected_skin()
		$"/root/root/play scene/Player/the camera/in game store".coin_count("die")
		c.condition("die")
		yield(c,"cdone")
		$"/root/root/play scene/Player/the camera/ui/center of controller/joi stick".moving_character = 1
		$"/root/root/play scene/map/spike chamber".hide()
		$"/root/root/play scene/map/wall 19".hide()




func visibility(x):
	if x == 1 :
		match player.skin :
			"default" :
				$"/root/root/play scene/Player/default".hide()
			"uniform" :
				$"/root/root/play scene/Player/uniform".hide()
			"yoga" :
				$"/root/root/play scene/Player/yoga teacher".hide()
			"ghost die" :
				$"/root/root/play scene/Player/ghost die".hide()
			"ghost skin" :
				$"/root/root/play scene/Player/ghost skin".hide()
	if x == 2 :
		match player.skin :
			"default" :
				$"/root/root/play scene/Player/default".show()
			"uniform" :
				$"/root/root/play scene/Player/uniform".show()
			"yoga" :
				$"/root/root/play scene/Player/yoga teacher".show()
			"ghost die" :
				$"/root/root/play scene/Player/ghost die".show()
			"ghost skin" :
				$"/root/root/play scene/Player/ghost skin".show()




func videom(x):
	if x == "club":
		match player.skin :
			"default" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/default stick.webm")
				z = video
				print(z)
			"uniform" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/uniform stick.webm")
				z = video
			"ghost die" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost stick.webm")
				z = video
			"ghost skin" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost stick.webm")
				z = video
			"yoga" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/yoga stick.webm")
				z = video
	elif x == "sword" :
		match player.skin :
			"default" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/default sword.webm")
				z = video
			"uniform" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/uniform sword.webm")
				z = video
			"ghost die" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost sword.webm")
				z = video
			"ghost skin" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost sword.webm")
				z = video
			"yoga" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/yoga sword.webm")
				z = video
	elif x == "gun" :
		match player.skin :
			"default" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/default gun.webm")
				z = video
			"uniform" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/uniform gun.webm")
				z = video
			"ghost die" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost gun.webm")
				z = video
			"ghost skin" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/ghost gun.webm")
				z = video
			"yoga" :
				var video = VideoStreamWebm.new()
				video.set_file("res://final/yoga gun.webm")
				z = video
