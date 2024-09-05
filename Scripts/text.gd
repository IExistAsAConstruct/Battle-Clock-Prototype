extends Control
@onready var text1:Node = get_node("Label")
@onready var text2:Node = get_node("Label2")
@onready var root:Node = get_parent()
var activeIcon:int = 0
var errorRange:float = 0.01
var doSwap:bool = false
var doSwapOpp:bool = false
var isText2:bool = false
var swapAllowed:bool = true
var minuteOn:bool = false
var secondOn:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text1.text = root.get_active_icons()[0].name

func _unhandled_input(event: InputEvent) -> void:
	if swapAllowed:
#region Move Right
		if event.is_action_pressed("ui_right"):
			swapAllowed = false
			var tween = get_tree().create_tween()
			tween.set_parallel()
			
			if activeIcon < 7:
				activeIcon += 1
			else:
				activeIcon = 0
			
			if isText2:
				text1.position = get_node("TexPosRight").position
				text1.text = root.get_active_icons()[activeIcon].name
				isText2 = false
				tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "position", get_node("TexPosLeft").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				await tween.finished
				swapAllowed = true
			else:
				text2.position = get_node("TexPosRight").position
				text2.text = root.get_active_icons()[activeIcon].name
				isText2 = true
				tween.tween_property(text1, "position", get_node("TexPosLeft").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
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
				activeIcon = 7
			
			if isText2:
				text1.position = get_node("TexPosLeft").position
				text1.text = root.get_active_icons()[activeIcon].name
				isText2 = false
				tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
				await tween.finished
				swapAllowed = true
			else:
				text2.position = get_node("TexPosLeft").position
				text2.text = root.get_active_icons()[activeIcon].name
				isText2 = true
				tween.tween_property(text1, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				await tween.finished
				swapAllowed = true
#endregion

#region Confirm Action
		if event.is_action_pressed("ui_accept"):
			swapAllowed = false
			
			if minuteOn or secondOn:
				var tween = get_tree().create_tween()
				tween.set_parallel()
				activeIcon = 0
				
				text1.text = root.get_active_icons()[activeIcon].name
				text2.text = root.get_active_icons()[activeIcon].name
				
				if isText2:
					text1.position = get_node("TexPosLeft").position
					isText2 = false
					tween.tween_property(text1, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
					await tween.finished
				else:
					text2.position = get_node("TexPosLeft").position
					isText2 = true
					tween.tween_property(text1, "position", get_node("TexPosRight").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					tween.tween_property(text1, "self_modulate", Color(1, 1, 1, 0), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "position", get_node("TexPosCenter").position, 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					tween.tween_property(text2, "self_modulate", Color(1, 1, 1, 1), 0.15).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					await tween.finished
				swapAllowed = true
#endregion


func _on_conditions_minute_hand_toggled(toggled_on: bool) -> void:
	minuteOn = toggled_on


func _on_conditions_second_hand_toggled(toggled_on: bool) -> void:
	secondOn = toggled_on


func _on_second_hand_end_turn() -> void:
	swapAllowed = false


func _on_minute_hand_end_turn() -> void:
	swapAllowed = false
