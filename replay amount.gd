extends Label



onready var a = get_parent().get_parent().get_parent()
onready var b = $"/root/root/play scene/Player".skin
onready var c = $"/root/root/play scene/Player"
var text1 = "can't go wrong with the minimum\nreplayed time %s"
var text2 = "why did i added this ? nobody knows\nreplayed time %s"
var text3 = "a ghost that doesn't have the ability to dogde\nreplayed time %s"
var text4 = "every game need at least one\nreplayed time %s"

func _on_inventory_pick_default():
	set_text(text1 % a.replay_amount)

func _on_inventory_pick_ghost():
	set_text(text3 % a.replay_amount)

func _on_inventory_pick_uniform():
	set_text(text2 % a.replay_amount)

func _on_inventory_pick_yoga():
	set_text(text4 % a.replay_amount)

func _on_inventory_visibility_changed():
	set_text(text1 % a.replay_amount)
