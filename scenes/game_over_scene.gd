extends Node2D

var can_change : bool = false
var world = preload("res://scenes/transition.tscn")

func _on_wait_for_input_collection_timeout():
	can_change = true

func _process(delta):
	if Input.is_anything_pressed() and can_change:
		get_tree().change_scene_to_packed(world)
