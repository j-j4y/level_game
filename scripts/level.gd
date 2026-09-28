extends Node2D

@onready var blockobject = preload("res://scenes/block.tscn")

var columns = 32
var rows = 7
var margin = 50

func  _ready() -> void:
	setupLevel()
	
func setupLevel():
	
	for r in rows:
		for c in columns:
			
			var new_block = blockobject.instantiate()
			add_child(new_block)
			new_block.position = Vector2(margin + (40*c), margin + (40*r))
