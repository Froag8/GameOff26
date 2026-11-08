extends Node2D

@export var spawn_time = 3.0
var obstacle_scene = preload("res://Scenes/obstacle_1.tscn")
var player 
var move_speed = 3
var direction = 1
var speed_direction = 0
var spawn_point = Vector2(-100, 50)

func _ready():
	player = get_parent().get_node("Player/Player")
	direction = [-1, 1].pick_random() #-1 = right, 1 = left
	#move_speed = randf_range(1.0, 3.0)
	speed_direction = move_speed * direction
	if direction == -1:
		spawn_point = Vector2(1252, 50)
	else:
		spawn_point = Vector2(-100, 50)
	
	print("Direction: ", direction)
	print("Speed: ", move_speed)
	print("Delay: ", spawn_time)
	
	spawn_obstacle()

func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	
	obstacle.speed_direction = speed_direction
	obstacle.direction = direction
	
	obstacle.global_position = spawn_point
	add_child.call_deferred(obstacle)
	
	var area = obstacle.get_node("Obstacle")
	area.body_entered.connect(player._on_obstacle_body_entered)
	
	await get_tree().create_timer(spawn_time).timeout
	spawn_obstacle()
