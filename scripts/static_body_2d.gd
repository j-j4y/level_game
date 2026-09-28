extends StaticBody2D

@export var speed := 500  # Move speed

func _process(delta):
	var move_direction = 0
	if Input.is_action_pressed("ui_left"):
		move_direction = -1
	elif Input.is_action_pressed("ui_right"):
		move_direction = 1

	position.x += move_direction * speed * delta
	position.x = clamp(position.x, 50, 750)  # Keep it inside screen (I set my screen width 600 pixels)
