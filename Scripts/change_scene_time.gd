extends Control

func _on_previous_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/battle_clock.tscn")
