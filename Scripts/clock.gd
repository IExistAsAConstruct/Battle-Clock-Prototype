extends Node2D
@onready var hourHand:Node = get_node("HourHand")
@onready var minuteHand:Node = get_node("MinuteHand")
@onready var secondHand:Node = get_node("SecondHand")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


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
