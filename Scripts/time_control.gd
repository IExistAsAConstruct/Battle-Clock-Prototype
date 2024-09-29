extends Control
@export var minute:int = 0
@export var hour:int = 0
@export var secondInterval:int = 1
var second:int = 0
var trueHour:int = 0

var timer:Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trueHour = hour
	timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(secondInterval/60.0)
	timer.set_one_shot(false)
	timer.start()
	
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	second += 1
	
	if second >= 60:
		second = 0
		minute += 1
	
	if minute >= 60:
		minute = 0
		hour += 1

	if hour >= 24:
		hour = 0
	trueHour = hour

func _on_activate_time_toggled(toggled_on: bool) -> void:
	timer.set_paused(!toggled_on)

func get_hour() -> int:
	return trueHour

func get_minute() -> int:
	return minute
	
func get_second() -> int:
	return second

func get_second_interval() -> int:
	return secondInterval


func _on_interval_set_value_changed(value: float) -> void:
	@warning_ignore("narrowing_conversion") secondInterval = value
	timer.set_wait_time(secondInterval/60.0)
