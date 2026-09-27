extends CharacterBody2D


var ball_speed = 200.0
var dir = Vector2.DOWN
var is_active = true

func _ready() -> void:
	velocity = Vector2(ball_speed* -1, ball_speed)
	
	
func _physics_process(delta: float) -> void:
	if is_active:
		var collison = move_and_collide(velocity*delta)
		
		if collison:
			velocity = velocity.bounce(collison.get_normal())
			
		if(velocity.y >0 and velocity.y <100):
			velocity.y = -200
			
		if velocity.x == 0:
			velocity.x = -200
		
