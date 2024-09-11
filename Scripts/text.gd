extends Control
@onready var text1:Node = get_node("Label")
@onready var text2:Node = get_node("Label2")
@onready var root:Node = get_parent()
var activeIcon:int = 0
var errorRange:float = 0.01
var doSwap:bool = true
var isText2:bool = false
var swapAllowed:bool = true
var minuteOn:bool = false
var secondOn:bool = false
var maxIcon:int = 7
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text1.text = root.get_active_icons()[0].name

func _unhandled_input(event: InputEvent) -> void:
	if doSwap:
		if swapAllowed:
#region Move Right
			if event.is_action_pressed("ui_right"):
				swapAllowed = false
				var tween = get_tree().create_tween()
				tween.set_parallel()
				
				if activeIcon < maxIcon:
					activeIcon += 1
				else:
					activeIcon = 0
				
				if isText2:
					text1.position = get_node("TexPosRight").position
					text1.text = root.get_active_icons()[activeIcon].name
					isText2 = false
					tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosLeft").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					await tween.finished
					swapAllowed = true
				else:
					text2.position = get_node("TexPosRight").position
					text2.text = root.get_active_icons()[activeIcon].name
					isText2 = true
					tween.tween_property(text1, "position", get_node("TexPosLeft").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					await tween.finished
					swapAllowed = true
#endregion

#region Move Left
			if event.is_action_pressed("ui_left"):
				swapAllowed = false
				var tween = get_tree().create_tween()
				tween.set_parallel()
				
				if activeIcon > 0:
					activeIcon -= 1
				else:
					activeIcon = maxIcon
				
				if isText2:
					text1.position = get_node("TexPosLeft").position
					text1.text = root.get_active_icons()[activeIcon].name
					isText2 = false
					tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					await tween.finished
					swapAllowed = true
				else:
					text2.position = get_node("TexPosLeft").position
					text2.text = root.get_active_icons()[activeIcon].name
					isText2 = true
					tween.tween_property(text1, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
					await tween.finished
					swapAllowed = true
#endregion

#region Confirm Action
			if event.is_action_pressed("ui_accept"):
				swapAllowed = false
				
				if (minuteOn or secondOn):
					var tween = get_tree().create_tween()
					activeIcon = 0
					
					if isText2:
						text1.text = root.get_active_icons()[activeIcon].name
						text2.text = root.get_active_icons()[activeIcon].name
						text1.position = get_node("TexPosLeft").position
						isText2 = false
						tween.set_parallel()
						tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text2, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						await tween.finished
						swapAllowed = true
					else:
						text1.text = root.get_active_icons()[activeIcon].name
						text2.text = root.get_active_icons()[activeIcon].name
						text2.position = get_node("TexPosLeft").position
						isText2 = true
						tween.set_parallel()
						tween.tween_property(text1, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
						await tween.finished
						swapAllowed = true
						
					swapAllowed = true
#endregion

func ended_turn() -> void:
	doSwap = false
	text1.text = root.get_active_icons()[activeIcon].name
	text2.text = root.get_active_icons()[activeIcon].name

#region Hand Toggle Signals
func _on_conditions_minute_hand_toggled(toggled_on: bool) -> void:
	minuteOn = toggled_on


func _on_conditions_second_hand_toggled(toggled_on: bool) -> void:
	secondOn = toggled_on
#endregion

#region End Turn Signals
func _on_second_hand_end_turn() -> void:
	ended_turn()


func _on_minute_hand_end_turn() -> void:
	ended_turn()


func _on_hour_hand_end_turn() -> void:
	ended_turn()


func _on_reset_button_pressed() -> void:
	reset()
#endregion
	
#region Toggle
func reset() -> void:
	doSwap = true
	var tween = get_tree().create_tween()
	tween.set_parallel()
	activeIcon = 0
	if isText2:
		text1.text = root.get_active_icons()[activeIcon].name
		text2.text = root.get_active_icons()[activeIcon].name
		text1.position = get_node("TexPosLeft").position
		isText2 = false
		tween.set_parallel()
		tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text2, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		await tween.finished
		swapAllowed = true
	else:
		text1.text = root.get_active_icons()[activeIcon].name
		text2.text = root.get_active_icons()[activeIcon].name
		text2.position = get_node("TexPosLeft").position
		isText2 = true
		tween.set_parallel()
		tween.tween_property(text1, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		await tween.finished
		swapAllowed = true

func changeMaxIcon(toggled_on: bool) -> void:
	if not toggled_on:
		maxIcon -= 1
	else:
		maxIcon += 1
	
func _on_fight_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()

func _on_magic_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_defend_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_item_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_flee_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_temporal_ability_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_party_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()


func _on_tactics_check_toggled(toggled_on: bool) -> void:
	changeMaxIcon(toggled_on)
	reset()
#endregion
