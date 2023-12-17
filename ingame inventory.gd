extends Sprite


onready var item1 = $"item1"
onready var item2 = $"item2"
onready var eitem = $"item equied"
var equipment_icon = load("res://prop/equiment icon final.png")
var equipment_slot_radius = 6.5
var i1_right_animation = Tween.new()
var i2_left_animation = Tween.new()
var ei_right_animation = Tween.new()
var ei_left_animation = Tween.new()
var i1_fade_animation = Tween.new()
var i2_fade_animation = Tween.new()
var club = AtlasTexture.new()
var sword = AtlasTexture.new()
var pistol = AtlasTexture.new()
var fake_key = AtlasTexture.new()
var real_key = AtlasTexture.new()
var pick = AtlasTexture.new()
var bought_item = []
var equipi
var pos
var pos1
var pos2




func _ready():
	i1_right_animation.set_name("i1_right_animation")
	item1.add_child(i1_right_animation)
	i1_right_animation.connect("tween_completed", self, "_on_i1_right_animation_completed" )
	
	i2_left_animation.set_name("i2_left_animation")
	item2.add_child(i2_left_animation)
	i2_left_animation.connect("tween_completed", self, "_on_i2_left_animation_completed" )
	
	ei_right_animation.set_name("ei_right_animation")
	eitem.add_child(ei_right_animation)
	ei_right_animation.connect("tween_completed", self, "_on_ei_right_animation_completed" )
	
	ei_left_animation.set_name("ei_left_animation")
	eitem.add_child(ei_left_animation)
	ei_left_animation.connect("tween_completed", self, "_on_ei_left_animation_completed" )
	
	i1_fade_animation.set_name("i1_fade_animation")
	item1.add_child(i1_fade_animation)
	i1_fade_animation.connect("tween_completed", self, "_on_i1_fade_animation_completed" )
	
	i2_fade_animation.set_name("i2_fade_animation")
	item2.add_child(i2_fade_animation)
	i2_fade_animation.connect("tween_completed", self, "_on_i2_fade_animation_completed" )
	
	club.atlas = equipment_icon
	club.region = Rect2(15,2,13,13)
	
	sword.atlas = equipment_icon
	sword.region = Rect2(1,2,13,13)
	
	pistol.atlas = equipment_icon
	pistol.region = Rect2(1,16,13,13)
	
	fake_key.atlas = equipment_icon
	fake_key.region = Rect2(29,2,13,13)
	
	real_key.atlas = equipment_icon
	real_key.region = Rect2(15,16,13,13)
	
	pick.atlas = equipment_icon
	pick.region = Rect2(44,2,13,13)




func _input(event):
	if event is InputEventScreenTouch and event.is_pressed() :
		var dis_from_1item_slot = (event.position - item1.get_global_transform_with_canvas().origin).length()
		var dis_from_2item_slot = (event.position - item2.get_global_transform_with_canvas().origin).length()
		if (ei_left_animation.is_active() == false or ei_right_animation.is_active() == false) and bought_item.size() > 1 :
			if dis_from_1item_slot <= equipment_slot_radius :
				i1_right_animation.interpolate_property(item1, "position", Vector2(-10.5,7.5), Vector2(7.5,7.5), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
				i1_right_animation.start()
				ei_right_animation.interpolate_property(eitem, "position", Vector2(7.5,7.5), Vector2(25.5,7.5), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
				ei_right_animation.start()
				i2_fade_animation.interpolate_property(item2, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.9, Tween.TRANS_LINEAR) 
				i2_fade_animation.start()
			elif dis_from_2item_slot <= equipment_slot_radius :
				i2_left_animation.interpolate_property(item2, "position", Vector2(25.5,7.5), Vector2(7.5,7.5), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
				i2_left_animation.start()
				ei_left_animation.interpolate_property(eitem, "position", Vector2(7.5,7.5), Vector2(-10.5,7.5), 1.0, Tween.TRANS_LINEAR, Tween.EASE_OUT)
				ei_left_animation.start()
				i1_fade_animation.interpolate_property(item1, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.9, Tween.TRANS_LINEAR) 
				i1_fade_animation.start()




func _on_in_game_store_bought_club():
	add_on(1)
func _on_in_game_store_bought_fk():
	add_on(2)
func _on_in_game_store_bought_pistol():
	add_on(3)
func _on_in_game_store_bought_rk():
	add_on(4)
func _on_in_game_store_bought_sword():
	add_on(5)
func _on_take_pick():
	add_on(6)




func add_on(y):
	var item_bought
	match y :
		1:
			item_bought = "club"
		2:
			item_bought = "fake_key"
		3:
			item_bought = "pistol"
		4:
			item_bought = "real_key"
		5:
			item_bought = "sword"
		6:
			item_bought = "pick"
	if bought_item.size() == 0 :
		bought_item.append(item_bought)
		item_pos_managerment(0)
		updateinv()
	elif bought_item.size() == 1 :
		bought_item.push_front(item_bought)
		item_pos_managerment(0)
		updateinv()
	elif bought_item.size() == 2 :
		bought_item.push_back(item_bought)
		item_pos_managerment(0)
		updateinv()
	else :
		bought_item.append(item_bought)
		item_pos_managerment(0)
		updateinv()




func _on_i1_right_animation_completed(_x,_y):
	item1.position = Vector2(-10.5,7.5)
func _on_i2_left_animation_completed(_x,_y):
	item2.position = Vector2(25.5,7.5)
func _on_ei_right_animation_completed(_x,_y):
	eitem.position = Vector2(7.5,7.5)
	ei_right_animation.remove_all()
	item_pos_managerment(-1)
	updateinv()
func _on_ei_left_animation_completed(_x,_y):
	eitem.position = Vector2(7.5,7.5)
	ei_left_animation.remove_all()
	item_pos_managerment(1)
	updateinv()
func _on_i1_fade_animation_completed(_x,_y):
	item1.modulate = Color(1,1,1,1)
func _on_i2_fade_animation_completed(_x,_y):
	item2.modulate = Color(1,1,1,1)




func updateinv():
	var atlas_data = {
		"club" : club,
		"sword" : sword,
		"pistol" : pistol,
		"fake_key" : fake_key,
		"real_key" : real_key,
		"pick" : pick
	}
	if ei_left_animation.is_active() == false or ei_right_animation.is_active() == false :
		eitem.set_texture(atlas_data[bought_item[pos]])
		item1.set_texture(atlas_data[bought_item[pos1]])
		item2.set_texture(atlas_data[bought_item[pos2]])
		equipi = bought_item[pos]




func item_pos_managerment(x):
	if x == 0 :
		if bought_item.size() == 1 :
			pos1 = 0
			pos = 0
			pos2 = 0
		elif bought_item.size() == 2 :
			pos1 = 0
			pos = 1
			pos2 = 0
		elif bought_item.size() == 3 :
			if pos == 1 :
				pos2 = 2
			else :
				pos1 = 2
		else :
			if pos == 0 :
				pos1 = bought_item.size() - 1
			elif pos == bought_item.size() - 2 :
				pos2 = bought_item.size() - 1
	elif x == -1 :
		pos1 = loop(-1,pos1)
		pos = loop(-1,pos)
		pos2 = loop(-1,pos2)
	elif x == 1 :
		pos1 = loop(1,pos1)
		pos = loop(1,pos)
		pos2 = loop(1,pos2)




func loop(x,y):
	if x == -1 :
		if y - 1 < 0 :
			return int(bought_item.size() - 1)
		else :
			return int(y - 1)
	else :
		if y + 1 > bought_item.size() - 1 :
			return int(0)
		else :
			return int(y + 1) 
