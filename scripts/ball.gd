extends CharacterBody2D


var ball_speed = 250.0
var dir = Vector2.DOWN
var is_active = true

func _ready() -> void:
	velocity = Vector2(ball_speed* -1, ball_speed)
	ball_speed = ball_speed + (150 * GameManager.level)
	
	
func _physics_process(delta: float) -> void:
	if is_active:
		var collison = move_and_collide(velocity*delta)

		if collison:
			velocity = velocity.bounce(collison.get_normal())
			
			if collison.get_collider().has_method("hit"):
				collison.get_collider().hit()

		if(velocity.y >0 and velocity.y <100):
			velocity.y = -200
			
		if velocity.x == 0:
			velocity.x = -200
	
	
func gameOver():
	GameManager.score = 0
	GameManager.level = 1
	get_tree().reload_current_scene()
	
	
func _on_deadzone_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(1).timeout
	gameOver()
	
