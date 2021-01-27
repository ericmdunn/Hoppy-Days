extends AnimatedSprite


# Called by Player in the physics process
func _on_Player_animate(motion):
	# If Player is moving up, use jump animation
	if motion.y < 0:
		play("jump")
		flip_h = false
	# If Player is moving left, use left animation
	elif motion.x < 0:
		play("walk")
		flip_h = true
	# If player is moving right, use right animation
	elif motion.x > 0:
		play("walk")
		flip_h = false
	# If none of the above, idle
	else:
		play("idle")
		flip_h = false

