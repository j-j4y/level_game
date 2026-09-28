extends Node

var score = 0
var level = 1

func addPoints(points):
	score += points
	
	
func _process(delta: float) -> void:
	$CanvasLayer/score.text = str(score)
	$CanvasLayer/level.text = "Level:" + str(level)
	
