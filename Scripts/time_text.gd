extends Label

# Time settings
@export var minute: int = 0
@export var hour: int = 0
@export var secondInterval: int = 1
var trueHour: int = 1

# 12-hour and AM/PM settings
var isPM: bool = false
var is24Hour: bool = false
var afternoonString: String = "AM"

# Clock control
var clockTicking: bool = true
var canSwap: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trueHour = hour
	update_clock_text()
	timeUpdate()

	# Updates the clock every second or based on the interval.
func timeUpdate() -> void:
	await get_tree().create_timer(secondInterval).timeout
	while clockTicking:
		minute += 1
		if minute > 59:
			minute = 0
			hour += 1
		adjust_time_format()
		update_clock_text()
		await get_tree().create_timer(secondInterval).timeout

# Adjusts time based on 12-hour or 24-hour format.
func adjust_time_format() -> void:
	if is24Hour:
		# Handle 24-hour clock format
		if hour > 23:
			hour = 0
			trueHour = hour
	else:
		# Handle 12-hour clock format
		if hour == 12:
			isPM = true
			afternoonString = "PM"
			trueHour = 12
		elif hour == 0:
			isPM = false
			afternoonString = "AM"
			trueHour = 12  # Midnight should be 12 AM
		elif hour > 12:
			isPM = true
			afternoonString = "PM"
			trueHour = hour - 12
		else:
			isPM = false
			afternoonString = "AM"
			trueHour = hour

func update_clock_text() -> void:
	if is24Hour:
		text = str(trueHour).pad_zeros(2) + ":" + str(minute).pad_zeros(2)
	else:
		text = str(trueHour).pad_zeros(2) + ":" + str(minute).pad_zeros(2) + " " + afternoonString

func get_hour() -> int:
	return trueHour

func get_minute() -> int:
	return minute

func get_second_interval() -> int:
	return secondInterval

func _on_activate_time_toggled(toggled_on: bool) -> void:
	if toggled_on:
		clockTicking = true
		timeUpdate()
	else:
		clockTicking = false


func _on_hour_slider_value_changed(value: float) -> void:
	if value == 0:
		is24Hour = false
		if hour > 12:
			trueHour = hour - 12
		else:
			trueHour = hour
		text = str(trueHour).pad_zeros(2) + ":" + str(minute).pad_zeros(2) + " " + afternoonString
	else:
		is24Hour = true
		trueHour = hour
		text = str(trueHour).pad_zeros(2) + ":" + str(minute).pad_zeros(2)


func _on_interval_set_value_changed(value: float) -> void:
	secondInterval = value
