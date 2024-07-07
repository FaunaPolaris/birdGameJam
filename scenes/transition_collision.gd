extends Area2D

var world = preload("res://scenes/world.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.has_overlapping_areas():
		print("colided")
		get_tree().change_scene_to_packed(world)
