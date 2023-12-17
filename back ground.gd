extends Sprite



onready var plb = $"play button"
onready var ib = $"inventory button"
onready var psb = $"setting button"
onready var cb = $"credit button"
onready var qb = $"quit button"
var pick_skin = false



func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(5)
	timer.set_one_shot(true)
	timer.start()
	timer.connect("timeout", self, "timeout")




func _on_play_button_pressed():
	if pick_skin == false :
		$"/root/root/play scene/Player".skin = "default"
	$"/root/root/play scene/Player".position = Vector2(70,450)
	$"/root/root/menu/back ground".hide()

func _on_inventory_button_pressed():
	get_parent().get_node("inventory").show()

func _on_credit_button_pressed():
	$"credit".show()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_setting_button_pressed():
	get_node("/root/root/play scene/Player/the camera/ui/setting menu")._on_setting_button_pressed()

func hide_c():
	$"credit".hide()




func timeout():
	var label = $"fuck"
	label.hide()
