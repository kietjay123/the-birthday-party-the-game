extends Sprite


onready var club = $"club"
onready var sword = $"sword"
onready var pistol = $"pisol"
onready var fake_key = $"fake key"
onready var real_key = $"real key"
onready var respawn_coin = $"respawn coin"
onready var seller_db = $"seller dialog box"
var rp  = 11
var shop_profit = 0
var selecting_item = 0
var bclub = false
var bsword = false
var bpistol = false
var bfake_key = false
var breal_key = false
signal bought_club
signal bought_sword
signal bought_pistol
signal bought_rk
signal bought_fk




func bill_board():
	var items_icon = [club,sword,pistol,fake_key,real_key]
	for i in items_icon :
		i.hide()
	items_icon[int(selecting_item)].show()




func text():
	var items_icon = [club,sword,pistol,fake_key,real_key,]
	match items_icon[int(selecting_item)] :
		club :
			seller_db.set_text("A club blessed by Jesus himself \nHave the ability to kill a ghost \nPRICE : 1 respawn coin")
		sword :
			seller_db.set_text("A sword blessed by Jesus himself \nHave the ability to kill a ghost \nPRICE : 2 respawn coin")
		pistol :
			seller_db.set_text("A M1911-A1 blessed by Jesus himself \nHave the ability to kill a ghost \nPRICE : 3 respawn coin")
		fake_key :
			seller_db.set_text("A key blessed by Jesus himself \nave the ability to open a door, there are doors \nPRICE : 4 respawn coin")
		real_key :
			seller_db.set_text("A key blessed by Jesus himself \nHave the ability to open a door, there are doors \nPRICE : 5 respawn coin")




func _on_joi_stick_move_left():
	if selecting_item == 0 :
		selecting_item = 4
	elif selecting_item != 0 :
		selecting_item -= 1
	bill_board()
	text()




func _on_joi_stick_move_right():
	if selecting_item == 4 :
		selecting_item = 0
	elif selecting_item != 4 :
		selecting_item += 1 
	bill_board()
	text()




func _on_button_2_pressed():
	var items_icon = [club,sword,pistol,fake_key,real_key,]
	match items_icon[int(selecting_item)] :
		club :
			if bclub == false and rp >= 1 :
				emit_signal("bought_club")
				bclub = true
				coin_count("club")
				shop_profit += 1
				respawn_coin.set_text(str(rp))
		sword :
			if bsword == false and rp >= 2 :
				emit_signal("bought_sword")
				bsword = true
				coin_count("sword")
				shop_profit += 2
				respawn_coin.set_text(str(rp))
		pistol :
			if bpistol == false and rp >= 3 :
				emit_signal("bought_pistol")
				bpistol = true
				coin_count("pistol")
				shop_profit += 3
				respawn_coin.set_text(str(rp))
		real_key :
			if breal_key == false and rp >= 5 :
				emit_signal("bought_rk")
				breal_key = true
				coin_count("real_key")
				shop_profit += 5
				respawn_coin.set_text(str(rp))
		fake_key :
			if bfake_key == false and rp >= 4 :
				emit_signal("bought_fk")
				bfake_key = true
				coin_count("fake_key")
				shop_profit += 4
				respawn_coin.set_text(str(rp))




func _on_in_game_store_visibility_changed():
	if self.visible == true :
		respawn_coin.set_text(str(rp))




func coin_count(x):
	match x :
		"die" :
			rp += 1
		"club" :
			rp -= 1
		"sword" :
			rp -= 2
		"pistol" :
			rp -= 3
		"fake_key" :
			rp -= 4
		"real_key" :
			rp -= 5
		"steal" :
			rp += shop_profit
