extends AudioStreamPlayer


onready var setting_menu = $"/root/root/play scene/Player/the camera/ui/setting menu"
onready var soundb = $"/root/root/play scene/Player/the camera/ui/setting menu/sound"
var pre_db


# Called when the node enters the scene tree for the first time.
func _ready():
	soundb.connect("pressed", self, "pressed")
	pre_db = self.get_volume_db()



func pressed():
	if setting_menu.mute == false :
		self.set_volume_db(pre_db)
	else :
		self.set_volume_db(-80)
