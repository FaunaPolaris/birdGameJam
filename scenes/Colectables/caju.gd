extends Area2D

var destroy : bool = false

func _process(delta):
	if self.has_overlapping_bodies():
		if 		get_parent().get_parent().get_parent().get_node("Player").hunger < 10:
			get_parent().get_parent().get_parent().get_node("Player").hunger += 1.2
		destroy = true
		$"../Sprite2D".hide()
		if not $"../Coin.is_playing()":
			$"../Coin".play()
	if not $"../Coin".is_playing() && destroy:
		get_parent().queue_free()
