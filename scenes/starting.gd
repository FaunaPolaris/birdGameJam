extends Node2D

var transition = preload("res://scenes/transition.tscn")
@onready var tucano = $interface/tucano
const START_SPEED : float = 15.0


func _ready():
	tucano.play("default")

func _process(delta):
	$interface.position.x += START_SPEED
	if Input.is_anything_pressed():
		get_tree().change_scene_to_packed(transition)
