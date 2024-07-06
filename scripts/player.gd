extends CharacterBody2D

var move : = 3
var minPos : = 36
var maxPos : = 1044
@onready var _animated_sprite = $AnimationPlayer

const MAX_SPEED : = 500
const ACCEL : = 1500
const FRICTION : = 600
var input = Vector2.ZERO

func _physics_process(delta):
	_animated_sprite.play("flying")
	player_movement(delta)
	
func get_input():
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (FRICTION * delta):
			velocity -= velocity.normalized() * (FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
			velocity += (input * ACCEL * delta)
			velocity = velocity.limit_length(MAX_SPEED)
	move_and_slide()
#func _physics_process(delta):
#
	#_animated_sprite.play("flying")
	#if Input.is_action_pressed("ui_up") && position.y != minPos:
		#position.y -= move 
	#if Input.is_action_pressed("ui_down") && position.y != maxPos:
		#position.y += move
