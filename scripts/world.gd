extends Node2D

const PLAYER_START_POS := Vector2i(640, 576)
const CAM_START_POS := Vector2i(960, 540)

var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	$Player.position = PLAYER_START_POS
	$Player.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = START_SPEED
	
	$Player.position.x += speed
	$Camera2D.position.x += speed



