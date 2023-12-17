extends Node2D



signal cdone
signal start
var page = "1"
var a = funcref(self, "dialog")
var b
var c
var d_vs_kts = "res://dialog/buy area/default vs kts.json"
var u_vs_kts = "res://dialog/buy area/uniform vs kts.json"
var g_vs_kts = "res://dialog/buy area/ghost vs kts.json"
var y_vs_kts = "res://dialog/buy area/yoga teacher vs kts.json"
var d_vs_ktd = "res://dialog/talk to dev/default vs ktd.json"
var u_vs_ktd = "res://dialog/talk to dev/uniform vs ktd.json"
var g_vs_ktd = "res://dialog/talk to dev/ghost vs ktd.json"
var y_vs_ktd = "res://dialog/talk to dev/yoga teacher vs ktd.json"
var d_fp = "res://dialog/final prize/final prize default.json"
var u_fp = "res://dialog/final prize/final prize uniform.json"
var g_fp = "res://dialog/final prize/final prize ghost skin.json"
var y_fp = "res://dialog/final prize/final prize yoga.json"
var take_coin = "res://dialog/take coin/take coin.json"
var pit_die = "res://dialog/pit/pit ghost die.json"
var pit_skin = "res://dialog/pit/pit ghost skin.json"
var rp_dead = "res://dialog/respawn button/respawn button dead.json"
var rp_live = "res://dialog/respawn button/respawn button live.json"
var d_stick = "res://dialog/big door/door stick.json"
var d_sword = "res://dialog/big door/door sword.json"
var d_gun = "res://dialog/big door/door gun.json"
var d_fake_k = "res://dialog/big door/door fake key.json"
var d_real_k = "res://dialog/big door/door real key.json"
var d_pick = "res://dialog/big door/door pick.json"
var d_no_tool = "res://dialog/big door/door no tool.json"
var d_si = "res://dialog/big door/secret interaction.json"
onready var player = get_node("/root/root/play scene/Player")
onready var dbox = get_node("/root/root/play scene/Player/dialog boxes/dialog box")
onready var timer = $"dialog timer"
onready var tbd = $"text box default"
onready var tbu = $"text box dev"
onready var tbg = $"text box ghost"
onready var tby = $"text box yoga teacher"
onready var tbsk =$"text box shop keeper"
onready var tbtd =$"text box dev"





func condition(x):
	emit_signal("start")
	self.show()
	match x :
		"door stick" :
			a.call_func(conversation(d_stick))
			b = conversation(d_stick)
		"door sword" :
			a.call_func(conversation(d_sword))
			b = conversation(d_sword)
		"door gun" :
			a.call_func(conversation(d_gun))
			b = conversation(d_gun)
		"fake key" :
			a.call_func(conversation(d_fake_k))
			b = conversation(d_fake_k)
		"real key" :
			a.call_func(conversation(d_real_k))
			b = conversation(d_real_k)
		"pick" :
			a.call_func(conversation(d_pick))
			b = conversation(d_pick)
		"no tool" :
			a.call_func(conversation(d_no_tool))
			b = conversation(d_no_tool)
		"secret interaction" :
			a.call_func(conversation(d_si))
			b = conversation(d_si)
		_ :
			match player.skin :
				"default" :
					match x :
						"buy" :
							a.call_func(conversation(d_vs_kts))
							b = conversation(d_vs_kts)
						"dev" :
							a.call_func(conversation(d_vs_ktd))
							b = conversation(d_vs_ktd)
						"end" :
							a.call_func(conversation(d_fp))
							b = conversation(d_fp)
						"take" :
							a.call_func(conversation(take_coin))
							b = conversation(take_coin)
						"respawn" :
							a.call_func(conversation(rp_live))
							b = conversation(rp_live)
				"uniform" :
					match x :
						"buy" :
							a.call_func(conversation(u_vs_kts))
							b = conversation(u_vs_kts)
						"dev" :
							a.call_func(conversation(u_vs_ktd))
							b = conversation(u_vs_ktd)
						"end" :
							a.call_func(conversation(u_fp))
							b = conversation(u_fp)
						"take" :
							a.call_func(conversation(take_coin))
							b = conversation(take_coin)
						"respawn" :
							a.call_func(conversation(rp_live))
							b = conversation(rp_live)
				"ghost skin" :
					match x :
						"buy" :
							a.call_func(conversation(g_vs_kts))
							b = conversation(g_vs_kts)
						"dev" :
							a.call_func(conversation(g_vs_ktd))
							b = conversation(g_vs_ktd)
						"end" :
							a.call_func(conversation(g_fp))
							b = conversation(g_fp)
						"take" :
							a.call_func(conversation(take_coin))
							b = conversation(take_coin)
						"die" :
							a.call_func(conversation(pit_skin))
							b = conversation(pit_skin)
						"respawn" :
							a.call_func(conversation(rp_live))
							b = conversation(rp_live)
				"ghost die" :
					match x :
						"buy" :
							a.call_func(conversation(g_vs_kts))
							b = conversation(g_vs_kts)
						"take" :
							a.call_func(conversation(take_coin))
							b = conversation(take_coin)
						"die" :
							a.call_func(conversation(pit_die))
							b = conversation(pit_die)
						"respawn" :
							a.call_func(conversation(rp_dead))
							b = conversation(rp_dead)
				"yoga" :
					match x :
						"buy" :
							a.call_func(conversation(y_vs_kts))
							b = conversation(y_vs_kts)
						"dev" :
							a.call_func(conversation(y_vs_ktd))
							b = conversation(y_vs_ktd)
						"end" :
							a.call_func(conversation(y_fp))
							b = conversation(y_fp)
						"take" :
							a.call_func(conversation(take_coin))
							b = conversation(take_coin)
						"respawn" :
							a.call_func(conversation(rp_live))
							b = conversation(rp_live)




func conversation(file_path) -> Dictionary :
	var file = File.new()
	file.open(file_path, file.READ)
	var dialog = parse_json(file.get_as_text())
	return dialog




func dialog(x):
	var boxes = [tbd,tbu,tbg,tby,tbsk,tbtd]
	for i in boxes :
		i.hide()
	if x[str(page)]["name"] == "player" :
		match player.skin :
			"default" :
				tbd.show()
			"uniform" :
				tbu.show()
			"ghost skin" :
				tbg.show()
			"yoga" :
				tby.show()
			"ghost die" :
				tbg.show()
	elif x[str(page)]["name"] == "kiet the seller" :
		tbsk.show()
	elif x[str(page)]["name"] == "kiet the dev" :
		tbtd.show()
	dbox.set_visible_characters(0)
	dbox.set_bbcode(x[str(page)]["text"])
	timer.start()




func _on_button_1_pressed():
	if self.visible == true :
		page = "1"
		hide()
		emit_signal("cdone")




func _on_button_2_pressed():
	if self.visible == true :
		if dbox.get_visible_characters() != dbox.get_total_character_count() :
			timer.stop()
			dbox.set_visible_characters(dbox.get_total_character_count())
		elif dbox.get_visible_characters() == dbox.get_total_character_count() :
			if int(page) < b.size() :
				page =+ int(page) + 1 
				a.call_func(b)
			else :
				page = "1"
				emit_signal("cdone")




func _on_dialog_timer_timeout():
	dbox.set_visible_characters(dbox.get_visible_characters() + 1)
	if dbox.get_visible_characters() >= dbox.get_total_character_count() :
		timer.stop()


func _on_dialog_boxes_cdone():
	self.hide()
	
