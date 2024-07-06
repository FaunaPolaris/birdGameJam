extends Area2D

func _process(delta):
	if self.has_overlapping_bodies():
		if 		get_parent().get_parent().get_parent().get_node("Player").hunger < 10:
			get_parent().get_parent().get_parent().get_node("Player").hunger += 1.2
		get_parent().queue_free()
