extends Node2D

@export var fall_speed = 20.0
var top_bg = Vector2(576, -432.584)

func _process(delta):
	var bg1 = $Background/Sprite2D
	var bg2 = $Background/Sprite2D2
	var bg3 = $Background/Sprite2D3
	if bg1.position.y >= 1297:
		bg1.position = top_bg
	if bg2.position.y >= 1297:
		bg2.position = top_bg
	if bg3.position.y >= 1297:
		bg3.position = top_bg

func _physics_process(delta):
	for child in get_children():
		child.position.y += fall_speed * delta
