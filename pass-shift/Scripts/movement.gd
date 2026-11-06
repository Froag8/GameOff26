extends CharacterBody2D

# VARIABLES
var move_distance = 100
var move_speed = 1200
var moving = false
var hit_obstacle = false


# CHECK FOR ARROW KEYS
func _process(_delta):
	if moving or hit_obstacle:
		return

	var direction = Vector2.ZERO

	if Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP

	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN

	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT

	elif Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT

	if direction != Vector2.ZERO:
		move_character(direction)


# MOVE CHARACTER
func move_character(direction):
	moving = true
	var target = position + direction * move_distance
	var tween = create_tween()

	tween.tween_property(
		self,
		"position",
		target,
		float(move_distance) / move_speed
	)
	await tween.finished
	moving = false


func _on_obstacle_body_entered(_body):
	hit_obstacle = true
	print("PLAYER HIT!")
	get_tree().paused = true
