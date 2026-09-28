extends RigidBody2D


func hit():
	
	GameManager.addPoints(1)
	remove_from_group('Block')
	
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	
	var blocksLeft = get_tree().get_nodes_in_group('Block')
	
	if blocksLeft.is_empty():
		get_parent().get_node("Ball").is_active = false
		await get_tree().create_timer(1).timeout
		GameManager.level += 1
		get_tree().reload_current_scene()
	else:
		await get_tree().create_timer(1).timeout
		queue_free()
