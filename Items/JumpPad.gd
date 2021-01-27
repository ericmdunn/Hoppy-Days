extends Area2D


# Should only trigger when Player enters jumpad
func _on_JumpPad_body_entered(body):
	# Check if Player has boost method and run that while updating self to play boost animation
	if body.has_method("boost"):
		$AnimationPlayer.play("boost")
		body.boost()
