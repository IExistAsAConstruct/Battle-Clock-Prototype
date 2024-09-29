extends Label

@onready var root:Node = get_parent().get_parent()
var hourText:String = "00"
var minuteText:String = "00"
var is24Hour:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var hour:float = root.get_node("TimeControl").get_hour()
	var minute:float = root.get_node("TimeControl").get_minute()
	hourText = str(hour).pad_zeros(2)
	minuteText = str(minute).pad_zeros(2)
	
	if is24Hour:
		text = hourText + ":" + minuteText
	else:
		# sets the time displayed by the hour text to 12 if hour equals 0 (12 AM),
		# the hour itself from 1 AM - 12 PM, and the hour value minus 12 from 1 - 11 PM.
		hourText = "12" if hour == 0 else str(hour).pad_zeros(2) if hour < 13 else str(hour - 12)
		text = hourText + ":" + minuteText
		text = text + " AM" if hour < 13 else " PM"


func _on_hour_slider_value_changed(value: float) -> void:
	is24Hour = value
