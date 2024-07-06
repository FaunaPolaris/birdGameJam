extends Area2D

var bird = preload("res://scenes/PicaPau.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.has_overlapping_bodies():
		if 		get_parent().get_parent().get_parent().get_node("Player").hunger < 10:
			get_parent().get_parent().get_parent().get_node("Player").hunger += 3
		var defensors : int = abs(randf_range(0, 5))
		for enemy in defensors:
			var instance = bird.instantiate()
			instance.position.x = get_parent().get_parent().get_parent().get_node("Player").position.x + 2040 + randf_range(0, 3600)
			instance.position.y = randf_range(56, 1024)
			get_parent().get_parent().get_parent().add_child(instance)
		get_parent().queue_free()
