extends Node2D

@onready var blockobject = preload("res://scenes/block.tscn")



var columns = 32
var rows = 7
var margin = 50



func  _ready() -> void:
	setupLevel()
	
func setupLevel():
	
	var colors = get_colors()
	colors.shuffle()

	for r in rows:
		for c in columns:
			var randomNumber = randi_range(0,2)
			if randomNumber > 0:
				
				var new_block = blockobject.instantiate()
				add_child(new_block)
				new_block.position = Vector2(margin + (40*c), margin + (40*r))
				
				var sprite = new_block.get_node('Sprite2D')
				if r <= 9:
					sprite.modulate = colors[0]
				if r < 6:
					sprite.modulate = colors[1]
				if r < 6:
					sprite.modulate = colors[2]
func get_colors():
	var colors = [
		Color(0,1,1,1),
		Color(0.54,0.17,0.89,1),
		Color(0.68,1,0.18,1),
		Color(1,0.4,0.6,1),
	]
	return colors
