extends TouchScreenButton


var radius = Vector2(12,12)
var boundary = 17
var ongoingdrag = -1
var return_accel = 25
var moving_character = 1
var moving_count_down = true
signal move_left
signal move_right
signal move_up
signal move_down
signal timer_on
signal timer_off




func _get_button_pos():
	return position + radius




func _process(delta):
	if ongoingdrag == -1 :
		var pos_difference = Vector2(0,0) - radius - position
		position += pos_difference * delta * return_accel




func _input(event):
	if event is InputEventScreenDrag or ( event is InputEventScreenTouch and event.is_pressed()):
		var event_dist_from_centre = (event.position - get_parent().position).length()
		if event_dist_from_centre <= boundary * global_scale.x or event.get_index() == ongoingdrag :
			set_position(event.position - radius - Vector2(29,107) * global_scale)
			if _get_button_pos().length() > boundary and moving_character == 1 :
				var a = rad2deg(_get_button_pos().angle())
				if a <= -20 and a >= -70 :
					set_position( Vector2(1,-1).normalized() * boundary - radius)
				elif a >= 20 and a <= 70 :
					set_position( Vector2(1,1).normalized() * boundary - radius)
				elif a >= -160 and a <= -110 :
					set_position( Vector2(-1,-1).normalized() * boundary - radius)
				elif a <= 160 and a >= 110 :
					set_position( Vector2(-1,1).normalized() * boundary - radius)
				else :
					set_position( _get_button_pos().normalized() * boundary - radius)
			if _get_button_pos().length() > boundary and moving_character == 0 :
				var a = rad2deg(_get_button_pos().angle())
				if a <= 20 and a >= -20 :
					set_position( Vector2(1,0).normalized() * boundary - radius)
					if moving_count_down == true :
						emit_signal("timer_on")
						emit_signal("move_right")
						moving_count_down = false
				elif a >= -110 and a <= -70 :
					set_position( Vector2(0,-1).normalized() * boundary - radius)
					if moving_count_down == true :
						emit_signal("timer_on")
						emit_signal("move_up")
						moving_count_down = false
				elif a >= 160 and a > 0 or a <= -160 and a < 0 : 
					set_position( Vector2(-1,0).normalized() * boundary - radius)
					if moving_count_down == true :
						emit_signal("timer_on")
						emit_signal("move_left")
						moving_count_down = false
				elif a <= 110 and a >= 70 :
					set_position( Vector2(0,1).normalized() * boundary - radius)
					if moving_count_down == true :
						emit_signal("timer_on")
						emit_signal("move_down")
						moving_count_down = false
				else :
					set_position( _get_button_pos().normalized() * boundary - radius)
			ongoingdrag = event.get_index()
	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == ongoingdrag :
		ongoingdrag = -1
		moving_count_down = true
		emit_signal("timer_off")




func get_value() :
	if _get_button_pos().length() == boundary :
		if (round(_get_button_pos().x) == 12 or round(_get_button_pos().x) == -12) and (round(_get_button_pos().y) == 12 or round(_get_button_pos().y) == -12) :
			return _get_button_pos().normalized()
		else:
			return Vector2(0,0)
	else :
		return Vector2(0,0)




func _on_Timer_timeout():
	moving_count_down = true
