extends Node2D

@export var fall_speed = 10

#exempt from falling
@onready var node = $Node2D
@onready var dont = $Node2D2

func _physics_process(delta):
	for child in get_children():
		if child != node and child != dont:
			child.position.y += fall_speed * delta
