extends Control
@onready var minuteHand:Node = get_node("MinuteHandCheck")
@onready var secondHand:Node = get_node("SecondHandCheck")
@onready var clock:Node = get_parent().get_node("Clock")
signal second_hand_toggled(toggled_on:bool)
signal minute_hand_toggled(toggled_on:bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


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
