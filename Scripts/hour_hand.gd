extends Sprite2D

var lastHandPos:int = 0
var handPos:int = 1
var doRotate:bool = false
var doRotateCcw:bool = false
var errorRange:float = 0.001
var minuteHandToggled:bool = false
var vfxHappen:bool = false
var canRotate:bool = true
var effect:Node
var maxPos:int = 8
signal send_to_hand()
signal end_turn()
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	print(handPos)
	if canRotate:
		
#region Move CW
		if event.is_action_pressed("ui_right"):
			canRotate = false
			var tween = get_tree().create_tween()
			tween.set_parallel()
			
			if abs(rotation - 2*PI) <= errorRange:
				rotation = 0
			
			match maxPos:
				7:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position7_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				6:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position6_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				5:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position5_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				4:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position4_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				3:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position3_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				2:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position2_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				_:
					if handPos < maxPos:
						handPos += 1
						tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					else:
						handPos = 1
						tween.tween_property(get_node("."), "rotation", 2*PI, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						
			await tween.finished
			canRotate = true
#endregion
			
#region Move CCW
		if event.is_action_pressed("ui_left"):
			canRotate = false
			var tween = get_tree().create_tween()
			tween.set_parallel()
			
			if abs(rotation - 0) <= errorRange:
				rotation = 2*PI
				
			match maxPos:
				7:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position7_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				6:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position6_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				5:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position5_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				4:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position4_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				3:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position3_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				2:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position2_" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				_:
					if handPos > 1:
						handPos -= 1
					else:
						handPos = maxPos
					tween.tween_property(get_node("."), "rotation", get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
			await tween.finished
			canRotate = true
#endregion
			
#region Accept Action
		if event.is_action_pressed("ui_accept"):
			# Freeze hour hand and change its color
			canRotate = false
			var tween = get_tree().create_tween()
			tween.set_parallel()
			modulate = Color.BLUE_VIOLET
			# Duplicate the hand in order to perform a visual effect
			effect = duplicate(0)
			effect.top_level = true
			effect.position = get_parent().get_parent().get_node("CenterClockPos").position
			effect.rotation = rotation
			add_child(effect)
			effect.visible = true
			tween.tween_property(effect, "scale", Vector2(2, 2), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property(effect, "self_modulate", Color(0.541176, 0.168627, 0.886275, 0), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			if minuteHandToggled:
				send_to_hand.emit()
			else:
				end_turn.emit()
			await tween.finished
			effect.free()
#endregion


#region Toggle
func _on_conditions_minute_hand_toggled(toggled_on: bool) -> void:
	minuteHandToggled = toggled_on

func changeMaxPos(toggled_on: bool) -> void:
	if not toggled_on:
		maxPos -= 1
	else:
		maxPos += 1

func _on_fight_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_magic_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_defend_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_item_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_flee_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_temporal_ability_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_party_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)


func _on_tactics_check_toggled(toggled_on: bool) -> void:
	changeMaxPos(toggled_on)
#endregion
