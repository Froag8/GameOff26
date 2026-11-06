extends Node2D

var spawn_time = 3.0
var obstacle_scene = preload("res://Scenes/obstacle_1.tscn")
var player 

func _ready():
	player = get_parent().get_node("Player/Player")
	spawn_obstacle()

func spawn_obstacle():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position = Vector2(0,0)
	get_parent().add_child.call_deferred(obstacle)
	
	var area = obstacle.get_node("Obstacle")
	area.body_entered.connect(player._on_obstacle_body_entered)
	
	await get_tree().create_timer(spawn_time).timeout
	spawn_obstacle()
