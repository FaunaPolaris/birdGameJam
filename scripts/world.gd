extends Node2D

#const obstacle = preload("res://scenes/levels/level_1.tscn")
const obstacle1 = preload("res://scenes/levels/level_2.tscn")
const obstacle2 = preload("res://scenes/levels/level_3.tscn")
const obstacle3 = preload("res://scenes/levels/level_4.tscn")
const game_over_img = preload("res://scenes/game_over_scene.tscn")
var scene_types := [obstacle1, obstacle2, obstacle3]
var obstacles : Array
var distance : float
var isRunning : bool = false
var last_scene


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
	#randomize_obstacles()
	distance = 0
	$Player.position = PLAYER_START_POS
	$Player.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$GameOver.position = Vector2.ZERO
	$Start.get_node("StartButton").show()
	$GameOver.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.

#func randomize_obstacles():
	#var obstacle_instance = obstacle.instantiate()
	#obstacle_instance.position.x = 2048
	#obstacle_instance.position.y = 128
	#add_child(obstacle_instance)
	#instances.append(obstacle_instance)
	#obstacle_instance = obstacle1.instantiate()
	#obstacle_instance.position.x = 2048 + 3840 + 1500
	#obstacle_instance.position.y = 128
	#add_child(obstacle_instance)
	#instances.append(obstacle_instance)
	#obstacle_instance = obstacle2.instantiate()
	#obstacle_instance.position.x = 2048 + 3840 + 3840 + 1500
	#obstacle_instance.position.y = 128
	#add_child(obstacle_instance)
	#instances.append(obstacle_instance)
	#obstacle_instance = obstacle3.instantiate()
	#obstacle_instance.position.x = 2048 + 3840 + 3840 + 1500 + 3840
	#obstacle_instance.position.y = 128
	#add_child(obstacle_instance)
	#instances.append(obstacle_instance)
	

	
func	generate_scenes():
	if obstacles.is_empty() or last_scene.position.x < distance + 100:
		var scene_type = scene_types[randi() % scene_types.size()]
		var scene
		scene = scene_type.instantiate()
		var scene_width = 3840
		var scene_x : int = 3840 + distance + 500
		last_scene = scene
		scene.position = Vector2i(scene_x, 128)
		add_child(scene)
		obstacles.append(scene)

func _process(_delta):
	if isRunning:
		$hungerBar.texture.width = $Player.hunger * 100
		player_speed = START_SPEED
		environment_speed = START_SPEED * .5
		distance += player_speed
		generate_scenes()
		$hungerBar.position.x += player_speed
		$Player.position.x += player_speed
		$Camera2D.position.x += player_speed
		$GameOver.position.x += player_speed
	else:
		if Input.is_anything_pressed():
			isRunning = true
			$Start.get_node("StartButton").hide()

func game_over():
	get_tree().paused = true
	$GameOver.show()
	#$Player._animated_sprite.play("tree_collision")
	#set_process(false)
	#var game_over_scene = game_over_img.instantiate()

