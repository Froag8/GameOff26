extends Node2D

var speed_direction
var direction
var textures = [
	preload("res://Graphics/car1red.png"),
	preload("res://Graphics/car2red.png"),
	preload("res://Graphics/car3red.png")
]

func _ready():
	var sprite = get_node("Obstacle/Sprite2D")
	sprite.texture = textures.pick_random()
	
	if direction == -1:
		sprite.rotation_degrees = 270

func _process(_delta):
	position.x += speed_direction
