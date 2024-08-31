extends Sprite2D

var lastHandPos:int = 0
var handPos:int = 1
var doRotate:bool = false
var doRotateCcw:bool = false
var errorRange:float = 0.001
var secondHandToggled:bool = false
var vfxHappen:bool = false
var canRotate:bool = false
var effect:Node
signal send_to_hand()
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if vfxHappen:
		effect.scale = lerp(effect.scale, Vector2(2, 2), 0.05)
		effect.self_modulate = lerp(effect.self_modulate, Color(0, 0, 1, 0), 0.05)
		if effect.self_modulate == Color(0, 0, 1, 0):
			effect.queue_free()
			vfxHappen = false
	if doRotate:
		if lastHandPos == 8:
			rotation = lerp(rotation, 2*PI, 0.4)
		else:
			rotation = lerp(rotation, get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation, 0.4)
		if abs(rotation - get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation) <= errorRange:
			doRotate = false
	if doRotateCcw:
		if lastHandPos == 2:
			rotation = lerp(rotation, 0.0, 0.4)
		else:
			rotation = lerp(rotation, get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation, 0.4)
		if abs(rotation - get_parent().get_node(("IconPositions/Position" + str(handPos))).rotation) <= errorRange:
			doRotateCcw = false

func _unhandled_input(event: InputEvent) -> void:
	if canRotate:
		if event.is_action_pressed("ui_right"):
			if abs(rotation - 2*PI) <= errorRange:
				rotation = 0 
			if handPos < 8:
				lastHandPos = handPos
				handPos += 1
			else:
				lastHandPos = handPos
				handPos = 1
			doRotate = true
			
		if event.is_action_pressed("ui_left"):
			if abs(rotation - 0) <= errorRange:
				rotation = 2*PI
			if handPos > 1:
				lastHandPos = handPos
				handPos -= 1
			else:
				lastHandPos = handPos
				handPos = 8
			doRotateCcw = true
			
		if event.is_action_pressed("ui_accept"):
			canRotate = false
			modulate = Color.BLUE_VIOLET
			effect = duplicate(0)
			effect.top_level = true
			effect.position = get_parent().get_parent().get_node("CenterClockPos").position
			effect.rotation = rotation
			add_child(effect)
			effect.visible = true
			vfxHappen = true
			if secondHandToggled:
				emit_signal("send_to_hand")

func _on_conditions_second_hand_toggled(toggled_on: bool) -> void:
	secondHandToggled = toggled_on


func _on_hour_hand_send_to_hand() -> void:
	canRotate = true
