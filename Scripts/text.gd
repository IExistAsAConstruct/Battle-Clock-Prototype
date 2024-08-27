extends Control
@onready var text1:Node = get_node("Label")
@onready var text2:Node = get_node("Label2")
@onready var root:Node = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text1.text = root.get_active_icons()[0].name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
