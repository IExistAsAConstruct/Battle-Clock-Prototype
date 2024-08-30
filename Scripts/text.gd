extends Control
@onready var text1:Node = get_node("Label")
@onready var text2:Node = get_node("Label2")
@onready var root:Node = get_parent()
var activeIcon:int = 0
var errorRange:float = 0.01
var doSwap:bool = false
var doSwapOpp:bool = false
var isText2:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text1.text = root.get_active_icons()[0].name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if doSwap:
		if not isText2:
			text2.text = root.get_active_icons()[activeIcon].name
			text1.position = lerp(text1.position, get_node("TexPosLeft").position, 0.4)
			text1.set_modulate(lerp(text1.get_modulate(), Color(1, 1, 1, 0), 0.4))
			text2.position = lerp(text2.position, get_node("TexPosCenter").position, 0.4)
			text2.set_modulate(lerp(text2.get_modulate(), Color(1, 1, 1, 1), 0.4))
			if abs((text1.position.x - get_node("TexPosLeft").position.x)) and abs((text2.position.x - get_node("TexPosCenter").position.x)) <= errorRange:
				doSwap = false
				isText2 = true
		else:
			text1.text = root.get_active_icons()[activeIcon].name
			text1.position = lerp(text1.position, get_node("TexPosCenter").position, 0.4)
			text1.set_modulate(lerp(text1.get_modulate(), Color(1, 1, 1, 1), 0.4))
			text2.position = lerp(text2.position, get_node("TexPosLeft").position, 0.4)
			text2.set_modulate(lerp(text2.get_modulate(), Color(1, 1, 1, 0), 0.4))
			if abs((text1.position.x - get_node("TexPosCenter").position.x)) and abs((text2.position.x - get_node("TexPosLeft").position.x)) <= errorRange:
				doSwap = false
				isText2 = false
				
	if doSwapOpp:
		if not isText2:
			text2.text = root.get_active_icons()[activeIcon].name
			text1.position = lerp(text1.position, get_node("TexPosRight").position, 0.4)
			text1.set_modulate(lerp(text1.get_modulate(), Color(1, 1, 1, 0), 0.4))
			text2.position = lerp(text2.position, get_node("TexPosCenter").position, 0.4)
			text2.set_modulate(lerp(text2.get_modulate(), Color(1, 1, 1, 1), 0.4))
			if abs((text1.position.x - get_node("TexPosRight").position.x)) and abs((text2.position.x - get_node("TexPosCenter").position.x)) <= errorRange:
				doSwapOpp = false
				isText2 = true
				
		else:
			text1.text = root.get_active_icons()[activeIcon].name
			text1.position = lerp(text1.position, get_node("TexPosCenter").position, 0.4)
			text1.set_modulate(lerp(text1.get_modulate(), Color(1, 1, 1, 1), 0.4))
			text2.position = lerp(text2.position, get_node("TexPosRight").position, 0.4)
			text2.set_modulate(lerp(text2.get_modulate(), Color(1, 1, 1, 0), 0.4))
			if abs((text1.position.x - get_node("TexPosCenter").position.x)) and abs((text2.position.x - get_node("TexPosRight").position.x)) <= errorRange:
				doSwapOpp = false
				isText2 = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		if isText2:
			text1.position = get_node("TexPosRight").position
		else:
			text2.position = get_node("TexPosRight").position
		if activeIcon < 7:
			activeIcon += 1
		else:
			activeIcon = 0
		doSwap = true
		
	if event.is_action_pressed("ui_left"):
		if isText2:
			text1.position = get_node("TexPosLeft").position
		else:
			text2.position = get_node("TexPosLeft").position
		if activeIcon > 0:
			activeIcon -= 1
		else:
			activeIcon = 7
		doSwapOpp = true
