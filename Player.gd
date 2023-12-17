extends KinematicBody2D


onready var joi_stick = get_node("the camera/ui/center of controller/joi stick")
onready var camera = $"the camera"
onready var root = $"/root/root"
var speed = 100
var skin = "default"
var secret_door = false
var animation_player
var preskin
var direction
var rsprite
var moving = false
var changeable_direction = [Vector2(1,-0.5), Vector2(-1,0.5)]



func _ready():
	preskin = selected_skin()




func _process(_delta):
	if joi_stick.moving_character == 1 :
		match int(round(rad2deg(joi_stick.get_value().angle()))) :
			45 :
# warning-ignore:return_value_discarded
				move_and_slide(Vector2(1,0.5).normalized() * speed)
				camera.force_update_scroll()
				direction = "dr"
				moving = true
				if animation_player.assigned_animation != "run down" or rsprite.is_flipped_h() == true :
					rsprite.set_flip_h(false)
					animation_player.play("run down")
			-45 :
# warning-ignore:return_value_discarded
				move_and_slide(changeable_direction[0].normalized() * speed)
				camera.force_update_scroll()
				direction = "ur"
				moving = true
				if animation_player.assigned_animation != "run up" or rsprite.is_flipped_h() == true :
					rsprite.set_flip_h(false)
					animation_player.play("run up")
			135 :
# warning-ignore:return_value_discarded
				move_and_slide(changeable_direction[1].normalized() * speed)
				camera.force_update_scroll()
				direction = "dl"
				moving = true
				if animation_player.assigned_animation != "run down" or rsprite.is_flipped_h() == false :
					rsprite.set_flip_h(true)
					animation_player.play("run down")
			-135 :
# warning-ignore:return_value_discarded
				move_and_slide(Vector2(-1,-0.5).normalized() * speed)
				camera.force_update_scroll()
				direction = "ul"
				moving = true
				if animation_player.assigned_animation != "run up" or rsprite.is_flipped_h() == false :
					rsprite.set_flip_h(true)
					animation_player.play("run up")
			_ :
				if moving == true :
					match direction :
						"dr" :
							animation_player.play_backwards("run down")
							moving = false
						"ur" :
							animation_player.play_backwards("run up")
							moving = false
						"dl" :
							rsprite.set_flip_h(true)
							animation_player.play_backwards("run down")
							moving = false
						"ul" :
							rsprite.set_flip_h(true)
							animation_player.play_backwards("run up")
							moving = false
				else :
					match direction :
						"dr" :
							animation_player.play("idle up")
						"ur" :
							animation_player.play("idle down")
						"dl" :
							rsprite.set_flip_h(true)
							animation_player.play("idle up")
						"ul" :
							rsprite.set_flip_h(true)
							animation_player.play("idle down")




func _on_joi_stick_released():
	if joi_stick.moving_character == 1 :
		var final_plyer_pos = self.global_position.round()
		self.set_global_position(final_plyer_pos)




func selected_skin():
	var default = $"default" 
	var uniform = $"uniform"
	var yoga = $"yoga teacher"
	var g_die = $"ghost die"
	var g_skin = $"ghost skin"
	var skins = [default,uniform,yoga,g_die,g_skin]
	match skin :
		"default" :
			for i in skins :
				if i == default :
					i.show()
				if i != default :
					i.hide()
					i.get_child(0).stop(true)
			rsprite = default
			animation_player = $"default/default AnimationPlayer"
			animation_player.play("idle down")
		"uniform" :
			for i in skins :
				if i == uniform :
					i.show()
				if i != uniform :
					i.hide()
					i.get_child(0).stop(true)
			rsprite = uniform
			animation_player = $"uniform/uniform AnimationPlayer"
			animation_player.play("idle down")
		"yoga" :
			for i in skins :
				if i == yoga :
					i.show()
				if i != yoga :
					i.hide()
					i.get_child(0).stop(true)
			rsprite = yoga
			animation_player = $"yoga teacher/yoga teacher AnimationPlayer"
			animation_player.play("idle down")
		"ghost skin" :
			for i in skins :
				if i == g_skin :
					i.show()
				if i != g_skin :
					i.hide()
					i.get_child(0).stop(true)
			rsprite = g_skin
			animation_player = $"ghost skin/ghost skin AnimationPlayer"
			animation_player.play("idle down")
		"ghost die" :
			for i in skins :
				if i == g_die :
					i.show()
				if i != g_die :
					i.hide()
					i.get_child(0).stop(true)
			rsprite = g_die
			animation_player = $"ghost die/ghost die AnimationPlayer"
			animation_player.play("idle down")
	return skin
