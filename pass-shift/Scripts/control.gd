extends Node2D

@export var fall_speed = 20.0
@onready var world = $"."
var top_bg = Vector2(576, -432.584)
var scroll_amount = 108.0
var scroll_duration = 0.1

func _process(_delta):
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

func move_up():
	var tween = create_tween()
	var moving_something = false

	for child in get_children():
		if child.name != "nil":
			if child is Node2D:
				moving_something = true
				tween.parallel().tween_property(
					child,
					"position",
					child.position + Vector2(0, scroll_amount),
					scroll_duration
				)

	if not moving_something:
		print("No objects found to move!")
