extends Node2D



signal respawn
signal buy
signal take_coin
signal big_door
signal secret_door
signal lock_pick
signal prize
signal dev
var replay_amount = 0
var save_path = "user://save.dat"
onready var bd = $"/root/root/play scene/map/big door/Area2D bd"
onready var sd = $"/root/root/play scene/map/secret door/Area2D sd"
onready var button1 = $"play scene/Player/the camera/ui/button 1"
onready var button2 = $"play scene/Player/the camera/ui/button 2"
onready var js_wheel = $"play scene/Player/the camera/ui/joi stick wheel"
onready var prop = load("res://prop/prop.png")
onready var js = $"play scene/Player/the camera/ui/center of controller/joi stick"
onready var player = $"play scene/Player"
var pre_used_textr_b1
var pre_used_textr_b2
var interactable = {
	"respawn" : false,
	"buy" : false,
	"take coin" : false,
	"big door" : false,
	"secret door" : false,
	"lock pick" : false,
	"prize" : false,
	"dev" : false
}
var interactable_areas = false



func _ready():
	loadin()
	redo_button(1)
	_on_inventory_visibility_changed()
	_on_credit_visibility_changed()
	_on_setting_menu_visibility_changed()
	_on_secret_door_interaction_visibility_changed()
	_on_in_game_store_visibility_changed()
	_on_back_ground_visibility_changed()
	_on_die_sign_visibility_changed()
	_on_dialog_boxes_visibility_changed()
	_on_win_sign_visibility_changed()




func buttons(x):
	var em_button = AtlasTexture.new()
	em_button.atlas = prop 
	em_button.region = Rect2(78,110,24,16)
	
	var back_button = AtlasTexture.new()
	back_button.atlas = prop 
	back_button.region = Rect2(128,110,24,16)
	
	var check_button = AtlasTexture.new()
	check_button.atlas = prop
	check_button.region = Rect2(153,110,24,16)
	
	var redo_button = AtlasTexture.new()
	redo_button.atlas = prop 
	redo_button.region = Rect2(78,127,24,16)
	
	var buy_button = AtlasTexture.new()
	buy_button.atlas = prop 
	buy_button.region = Rect2(103,127,24,16)
	
	var home_button = AtlasTexture.new()
	home_button.atlas = prop
	home_button.region = Rect2(128,127,24,16)
	
	var revive_button = AtlasTexture.new()
	revive_button.atlas = prop
	revive_button.region = Rect2(153,127,24,16)
	
	var blank_button = AtlasTexture.new()
	blank_button.atlas = prop
	blank_button.region = Rect2(78,144,24,16)
	
	match x :
		1 :
			button1.set_texture(back_button)
			button2.set_texture(check_button)
		2 :
			button1.set_texture(blank_button)
			button2.set_texture(blank_button)
		3 :
			button1.set_texture(back_button)
			button2.set_texture(redo_button)
		4 :
			button1.set_texture(back_button)
			button2.set_texture(blank_button)
		5 :
			button1.set_texture(back_button)
			button2.set_texture(buy_button)
		7 :
			button1.set_texture(blank_button)
			button2.set_texture(em_button)
		8 :
			button1.set_texture(home_button)
			button2.set_texture(blank_button)
		9 :
			button1.set_texture(blank_button)
			button2.set_texture(revive_button)
		10 :
			button1.set_texture(back_button)
			button2.set_texture(em_button)




func redo_button(y):
	if y == 1 :
		pre_used_textr_b1 = button1.get_texture()
		pre_used_textr_b2 = button2.get_texture()
	elif y == 2 :
		button1.set_texture(pre_used_textr_b1)
		button2.set_texture(pre_used_textr_b2)




func _on_inventory_visibility_changed():
	var inventory = $"menu/inventory"
	if inventory.visible == true :
		redo_button(1)
		buttons(1)
		for i in range(0, $"menu/back ground".get_child_count()) :
			if $"menu/back ground".get_child(i).get_class() != "Timer" :
				$"menu/back ground".get_child(i).hide()
		if button2.is_connected("pressed", inventory, "_on_button_2_pressed") == false :
			button2.connect("pressed", inventory, "_on_button_2_pressed")
		if button1.is_connected("pressed", inventory, "_on_button_1_pressed") == false :
			button1.connect("pressed", inventory, "_on_button_1_pressed")
	elif inventory.visible == false :
		redo_button(2)
		for i in range(0, $"menu/back ground".get_child_count()) :
			if $"menu/back ground".get_child(i).get_class() != "Timer" and $"menu/back ground".get_child(i).name != "credit" :
				$"menu/back ground".get_child(i).show()
		if button2.is_connected("pressed", inventory, "_on_button_2_pressed") == true :
			button2.disconnect("pressed", inventory, "_on_button_2_pressed")
		if button1.is_connected("pressed", inventory, "_on_button_1_pressed") == true :
			button1.disconnect("pressed", inventory, "_on_button_1_pressed")

func _on_credit_visibility_changed():
	var credit = $"menu/back ground/credit"
	if credit.visible == true :
		redo_button(1)
		buttons(4)
		if button1.is_connected("pressed", $"menu/back ground", "hide_c") == false :
			button1.connect("pressed", $"menu/back ground", "hide_c")
	elif credit.visible == false :
		redo_button(2)
		if button1.is_connected("pressed", $"menu/back ground", "hide_c") == true :
			button1.disconnect("pressed", $"menu/back ground", "hide_c")

func _on_setting_menu_visibility_changed():
	var setting_menu = $"/root/root/play scene/Player/the camera/ui/setting menu"
	var a = [$"menu/back ground/credit button",$"menu/back ground/inventory button",$"menu/back ground/play button",$"menu/back ground/quit button",$"menu/back ground/setting button"]
	if setting_menu.visible == true :
		redo_button(1)
		buttons(2)
		for i in a :
			i.hide()
		player.set_process(false)
	elif setting_menu.visible == false :
		redo_button(2)
		player.set_process(true)
		for i in a : 
			i.show()

func _on_secret_door_interaction_visibility_changed():
	var secret_door_interaction = $"/root/root/play scene/Player/the camera/secret door interaction"
	if secret_door_interaction.visible == true :
		buttons(4)
		if button1.is_connected("pressed", secret_door_interaction, "_on_button_1_pressed") == false :
			button1.connect("pressed", secret_door_interaction, "_on_button_1_pressed")
	elif secret_door_interaction.visible == false :
		redo_button(2)
		if button1.is_connected("pressed", secret_door_interaction, "_on_button_1_pressed") == true :
			button1.disconnect("pressed", secret_door_interaction, "_on_button_1_pressed")

func _on_in_game_store_visibility_changed():
	var in_store_game = $"/root/root/play scene/Player/the camera/in game store"#in store game ????
	if in_store_game.visible == true :
		redo_button(1)
		buttons(5)
		js_wheel.play("")
		if js.is_connected("move_left", in_store_game, "_on_joi_stick_move_left") == false :
			js.connect("move_left", in_store_game, "_on_joi_stick_move_left")
		if js.is_connected("move_right", in_store_game, "_on_joi_stick_move_right") == false :
			js.connect("move_right", in_store_game, "_on_joi_stick_move_right")
		if button2.is_connected("pressed", in_store_game, "_on_button_2_pressed") == false :
			button2.connect("pressed", in_store_game, "_on_button_2_pressed")
	elif in_store_game.visible == false :
		redo_button(2)
		js_wheel.play("",true)
		if js.is_connected("move_left", in_store_game, "_on_joi_stick_move_left") == true :
			js.disconnect("move_left", in_store_game, "_on_joi_stick_move_left")
		if js.is_connected("move_right", in_store_game, "_on_joi_stick_move_right") == true :
			js.disconnect("move_right", in_store_game, "_on_joi_stick_move_right")
		if button2.is_connected("pressed", in_store_game, "_on_button_2_pressed") == true :
			button2.disconnect("pressed", in_store_game, "_on_button_2_pressed")

func _on_back_ground_visibility_changed():
	var back_ground = $"menu/back ground"
	if back_ground.visible == true :
		redo_button(1)
		buttons(2)
		player.set_process(false)
		$"/root/root/play scene/Player/the camera/ui/setting button".hide()
	elif back_ground.visible == false :
		redo_button(2)
		player.set_process(true)
		$"/root/root/play scene/Player/the camera/ui/setting button".show()

func _on_die_sign_visibility_changed():
	var d_sign = get_node("/root/root/play scene/Player/the camera/notification sign/die sign")
	if d_sign.visible == true :
		buttons(9)
		if button2.is_connected("pressed", $"play scene/map/big door/Area2D bd", "revive") == false :
			button2.connect("pressed", $"play scene/map/big door/Area2D bd", "revive")
	elif d_sign.visible == false :
		if button2.is_connected("pressed", $"play scene/map/big door/Area2D bd", "revive") == true :
			button2.disconnect("pressed", $"play scene/map/big door/Area2D bd", "revive")

func _on_dialog_boxes_visibility_changed():
	var dbox = $"/root/root/play scene/Player/dialog boxes"
	if dbox.visible == true :
		buttons(10)
		if button1.is_connected("pressed", dbox, "_on_button_1_pressed") == false:
			button1.connect("pressed", dbox, "_on_button_1_pressed")
		if button2.is_connected("pressed", dbox, "_on_button_2_pressed") == false :
			button2.connect("pressed", dbox, "_on_button_2_pressed")
	elif dbox.visible == false :
		redo_button(2)
		if button1.is_connected("pressed", dbox, "_on_button_1_pressed") == true :
			button1.disconnect("pressed", dbox, "_on_button_1_pressed")
		if button2.is_connected("pressed", dbox, "_on_button_2_pressed") == true :
			button2.disconnect("pressed", dbox, "_on_button_2_pressed")
func _on_win_sign_visibility_changed():
	var wsign = $"/root/root/play scene/Player/the camera/notification sign/win sign"
	var prize = $"/root/root/play scene/map/final prize/interact area fp"
	if wsign.visible == true :
		buttons(8)
		if button1.is_connected("pressed", prize, "back") == false:
			button1.connect("pressed", prize, "back")
	elif wsign.visible == false :
		if button1.is_connected("pressed", prize, "back") == true:
			button1.disconnect("pressed", prize, "back")



func _on_button_2_pressed():
	if interactable_areas == true :
		for i in interactable.keys() :
			if interactable[i] == true :
				match i :
					"respawn" :
						emit_signal("respawn")
					"buy" :
						emit_signal("buy")
					"take coin" :
						emit_signal("take_coin")
					"big door" :
						emit_signal("big_door")
					"secret door" :
						emit_signal("secret_door")
					"lock pick" :
						emit_signal("lock_pick")
					"prize" :
						emit_signal("prize")
					"dev" :
						emit_signal("dev")
				interactable_areas = false




func loadin():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK :
			replay_amount = file.get_var()
			file.close()




func save():
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK :
		file.store_var(replay_amount)
		file.close()




