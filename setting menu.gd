extends Sprite



onready var sound = $"sound"
var sound_on = AtlasTexture.new()
var sound_off = AtlasTexture.new()
var btexture = load("res://prop/prop.png")
var mute = false
var jctogle = false



func _on_setting_button_pressed():
	self.show()
	$"/root/root/play scene/Player/the camera/ui/setting button".hide()

func _on_resume_pressed():
	self.hide()
	$"/root/root/play scene/Player/the camera/ui/setting button".show()

func _ready():
	sound_on.atlas = btexture
	sound_on.region = Rect2(41,110,33,9)
	
	sound_off.atlas = btexture
	sound_off.region = Rect2(41,120,33,9)


func _on_sound_pressed():
	if mute == false :
		sound.set_texture(sound_off)
		mute = true
	else :
		sound.set_texture(sound_on)
		mute = false


func _on_quit_pressed():
	self.hide()
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()




func _on_setting_button_menu_pressed():
	if jctogle == false :
		$"/root/root/play scene/Player/the camera/ui/ui overlay 1(turn off able in setting)".hide()
	else :
		$"/root/root/play scene/Player/the camera/ui/ui overlay 1(turn off able in setting)".show()
