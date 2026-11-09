extends Node2D

@export var spawn_interval = 5.4
@export var lane_spacing = 108.0

var obstacle_spawner_scene = preload("res://Scenes/obstacle_spawner.tscn")

func _ready():
	spawn_lane()

func spawn_lane():
	var spawn = randi_range(0, 3)
	if spawn == 0:
		await get_tree().create_timer(spawn_interval).timeout
		spawn_lane()
	
	var lane = obstacle_spawner_scene.instantiate()
	lane.position = Vector2(-100,-100)

	get_parent().add_child(lane)
	await get_tree().create_timer(spawn_interval).timeout
	spawn_lane()
