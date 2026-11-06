extends Node2D

func _ready():
	var player = $Player
	
func player_hit(_body):
	print("HIT")
	get_tree().paused = true
