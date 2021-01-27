extends Node2D

var taken = false

# Should only trigger when Player enters coin
func _on_Area2D_body_entered(body):
	# If the coin hasn't already been collected (done to prevent coins from collecting while in their die animation)
	if not taken:
		# Mark coin as collected, play the die animation, and add one to the coin count
		taken = true
		$AnimationPlayer.play("die")
		$AudioStreamPlayer2D.play()
		get_tree().call_group("GameState", "coin_up")


# Triggered by the animation player
func die():
	queue_free()
