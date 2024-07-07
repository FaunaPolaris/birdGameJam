extends Node2D

var can_change : bool = false
var init : bool = true
var world = preload("res://scenes/transition.tscn")

#func _on_wait_for_input_collection_timeout():
	#can_change = true

func _process(delta):
	if init:
		$toucan1.play()
		$toucan2.play()
		$toucan3.play()
		init = false
	if Input.is_anything_pressed() and can_change:
		get_tree().change_scene_to_packed(world)

func _on_timer_timeout():
	can_change = true
