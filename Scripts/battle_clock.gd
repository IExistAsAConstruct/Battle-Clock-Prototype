extends Control
@onready var activeIcons:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activeIcons = get_node("Clock/Icons").get_children()
	

func get_active_icons() -> Array:
	activeIcons = get_node("Clock/Icons").get_children()
	return activeIcons
