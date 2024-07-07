extends Sprite2D

var is_showing : bool = true
var i : int = 0

func _on_timer_timeout():
	if !is_showing:
		self.show()
		is_showing = true
	else:
		if i > 2:
			self.hide()
			is_showing = false
			i = 0
		else:
			i += 1
