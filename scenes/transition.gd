extends Node2D

@onready var tucano = $Node2D/tucano
const PLAYER_START_POS := Vector2i(640, 576)

func _ready():
	tucano.play("default")

func _process(delta):
	if tucano.position.x + $Node2D/Camera2D.position.x > PLAYER_START_POS.x + $Node2D/Camera2D.position.x:
		tucano.position.x -= 7
	tucano.position.x += 15
	$Node2D/Camera2D.position.x += 15
	$Node2D/Area2D.position.x += 15
