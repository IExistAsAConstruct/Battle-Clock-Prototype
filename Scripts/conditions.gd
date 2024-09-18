extends Control
@onready var minuteHand:Node = get_node("MinuteHandCheck")
@onready var secondHand:Node = get_node("SecondHandCheck")
@onready var clock:Node = get_parent().get_node("Clock")
signal second_hand_toggled(toggled_on:bool)
signal minute_hand_toggled(toggled_on:bool)
var iconsActive:int = 8

func _on_minute_hand_check_toggled(toggled_on: bool) -> void:
	if not toggled_on and secondHand.button_pressed:
		secondHand.button_pressed = false
		second_hand_toggled.emit(false)
	minute_hand_toggled.emit(toggled_on)


func _on_second_hand_check_toggled(toggled_on: bool) -> void:
	if toggled_on and not minuteHand.button_pressed:
		minuteHand.button_pressed = true
		minute_hand_toggled.emit(true)
	second_hand_toggled.emit(toggled_on)

func change_active_icon_count(toggle_on: bool) -> void:
	if toggle_on:
		iconsActive += 1
	else:
		iconsActive -= 1
	if iconsActive == 2:
		for child in get_children():
			if child is CheckBox:
				if child.button_pressed and (child != $MinuteHandCheck or child != $SecondHandCheck):
					child.disabled = true
	else:
		for child in get_children():
			if child is CheckBox:
				if child.button_pressed  and (child != $MinuteHandCheck or child != $SecondHandCheck):
					child.disabled = false

func _on_fight_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_magic_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_defend_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)

func _on_item_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_flee_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_temporal_ability_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_party_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)


func _on_tactics_check_toggled(toggled_on: bool) -> void:
	change_active_icon_count(toggled_on)
