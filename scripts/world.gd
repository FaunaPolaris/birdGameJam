extends Node2D

const obstacle = preload("res://scenes/levels/level_1.tscn")
const obstacle1 = preload("res://scenes/levels/level_2.tscn")
const obstacle2 = preload("res://scenes/levels/level_3.tscn")
const obstacle3 = preload("res://scenes/levels/level_4.tscn")
const game_over_img = preload("res://scenes/game_over_scene.tscn")
var scene_types := [obstacle, obstacle1, obstacle2, obstacle3]
var obstacles : Array
var distance : float
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
# Called every frame. 'delta' is the elapsed time since the previous frame.

func	generate_scenes():
	if obstacles.is_empty() or last_scene.position.x < distance + 100:
		var scene_type = scene_types[randi() % scene_types.size()]
		var scene
		scene = scene_type.instantiate()
		var scene_width = 3840
		var scene_x : int = 3840 + distance + 300
		last_scene = scene
		scene.position = Vector2i(scene_x, 128)
		add_child(scene)
		obstacles.append(scene)

func _process(_delta):
	player_speed = START_SPEED
	environment_speed = START_SPEED * .5
	
	get_node("hungerBar").texture.width = $Player.hunger * 100
	distance += player_speed
	generate_scenes()
	#randomize_obstacles()
	$hungerBar.position.x += player_speed
	$Player.position.x += player_speed
	$Camera2D.position.x += player_speed

func game_over():
	$Player._animated_sprite.play("tree_collision")
	set_process(false)
	var game_over_scene = game_over_img.instantiate()

