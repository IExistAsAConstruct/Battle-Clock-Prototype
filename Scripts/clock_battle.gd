extends Node2D
@onready var root:Node = get_parent()
@onready var hourHand:Node = get_node("HourHand")
@onready var minuteHand:Node = get_node("MinuteHand")
@onready var secondHand:Node = get_node("SecondHand")
@onready var iconParent:Node = get_node("Icons")
@onready var fightIcon:Node = get_node("Icons/Fight")
@onready var magicIcon:Node = get_node("Icons/Magic")
@onready var defendIcon:Node = get_node("Icons/Defend")
@onready var itemIcon:Node = get_node("Icons/Item")
@onready var fleeIcon:Node = get_node("Icons/Flee")
@onready var temporalAbilityIcon:Node = get_node("Icons/Temporal Ability")
@onready var partyIcon:Node = get_node("Icons/Party")
@onready var tacticsIcon:Node = get_node("Icons/Tactics")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_conditions_minute_hand_toggled(toggled_on: bool) -> void:
	if toggled_on:
		minuteHand.visible = true
	else:
		minuteHand.visible = false

func _on_conditions_second_hand_toggled(toggled_on: bool) -> void:
	if toggled_on:
		secondHand.visible = true
	else:
		secondHand.visible = false

#region Reset
func _on_reset_button_pressed() -> void:
	reset()

func reset() -> void:
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(hourHand, "modulate", Color(1, 1, 1), 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(minuteHand, "modulate", Color(1, 1, 1), 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(secondHand, "modulate", Color(1, 1, 1), 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(hourHand, "rotation", 0, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(minuteHand, "rotation", 0, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(secondHand, "rotation", 0, 0.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	await tween.finished
	hourHand.canRotate = true
	hourHand.handPos = 1
	minuteHand.canRotate = false
	minuteHand.handPos = 1
	secondHand.canRotate = false
	secondHand.handPos = 1
#endregion

#region Icon Positions
func rearrange_icons() -> void:
	var icons = root.get_active_icons()
	var i = 0
	for icon in icons:
		match icons.size():
			8:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position" + str(i + 1)).position
				i += 1
			7:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position7_" + str(i + 1)).position
				i += 1
			6:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position6_" + str(i + 1)).position
				i += 1
			5:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position5_" + str(i + 1)).position
				i += 1
			4:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position4_" + str(i + 1)).position
				i += 1
			3:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position3_" + str(i + 1)).position
				i += 1
			2:
				iconParent.move_child(icon, i)
				icon.offset = get_node("IconPositions/Position2_" + str(i + 1)).position
				i += 1
				
func reset_icons() -> void:
	if fightIcon in iconParent.get_children():
		iconParent.move_child(fightIcon, -1)
	if magicIcon in iconParent.get_children():
		iconParent.move_child(magicIcon, -1)
	if defendIcon in iconParent.get_children():
		iconParent.move_child(defendIcon, -1)
	if itemIcon in iconParent.get_children():
		iconParent.move_child(itemIcon, -1)
	if fleeIcon in iconParent.get_children():
		iconParent.move_child(fleeIcon, -1)
	if temporalAbilityIcon in iconParent.get_children():
		iconParent.move_child(temporalAbilityIcon, -1)
	if partyIcon in iconParent.get_children():
		iconParent.move_child(partyIcon, -1)
	if tacticsIcon in iconParent.get_children():
		iconParent.move_child(tacticsIcon, -1)
#endregion

#region Icon Activations
func _on_fight_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(fightIcon)
	else:
		iconParent.add_child(fightIcon)
		reset_icons()
	rearrange_icons()
	reset()

func _on_magic_check_toggled(toggled_on: bool) -> void:
	var iconPosition = root.get_active_icons()
	if not toggled_on:
		iconParent.remove_child(magicIcon)
	else:
		iconParent.add_child(magicIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_defend_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(defendIcon)
	else:
		iconParent.add_child(defendIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_item_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(itemIcon)
	else:
		iconParent.add_child(itemIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_flee_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(fleeIcon)
	else:
		iconParent.add_child(fleeIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_temporal_ability_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(temporalAbilityIcon)
	else:
		iconParent.add_child(temporalAbilityIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_party_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(partyIcon)
	else:
		iconParent.add_child(partyIcon)
		reset_icons()
	rearrange_icons()
	reset()


func _on_tactics_check_toggled(toggled_on: bool) -> void:
	if not toggled_on:
		iconParent.remove_child(tacticsIcon)
	else:
		iconParent.add_child(tacticsIcon)
		reset_icons()
	rearrange_icons()
	reset()
#endregion
