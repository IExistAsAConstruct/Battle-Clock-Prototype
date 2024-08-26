extends Sprite2D

var lastHandPos:int = 0
var handPos:int = 1
var doRotate:bool = false
var doRotateCcw:bool = false
var errorRange:float = 0.001
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
#	print(rotation)
#	print("hand position = " + str(handPos))
#	print("last hand position = " + str(lastHandPos))
#	print("rotating: " + str(doRotate))
#	print("rotating ccw: " + str(doRotateCcw))
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
