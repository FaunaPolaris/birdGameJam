extends Node2D

var obstacle = preload("res://scenes/levels/level_1.tscn")

var instances : Array

const PLAYER_START_POS := Vector2i(640, 576)
const CAM_START_POS := Vector2i(960, 540)

var player_speed : float
var environment_speed : float
const START_SPEED : float = 15.0
const MAX_SPEED : int = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	randomize_obstacles()
	$Player.position = PLAYER_START_POS
	$Player.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
# Called every frame. 'delta' is the elapsed time since the previous frame.

func randomize_obstacles():
	var obstacle_instance = obstacle.instantiate()
	obstacle_instance.position.x = 1024
	obstacle_instance.position.y = 128
	add_child(obstacle_instance)
	instances.append(obstacle_instance)
	
func game_over():
	$Player._animated_sprite.play("tree_collision")
	set_process(false)
	
func _process(_delta):
	player_speed = START_SPEED
	environment_speed = START_SPEED * .5
	
	#for tree in instances:
		#tree.position.x += environment_speed
		#if tree.get_node("Area").has_overlapping_bodies():
			#set_process(not is_processing())
	
	$Player.position.x += player_speed
	$Camera2D.position.x += player_speed



