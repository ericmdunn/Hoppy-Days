extends Node2D


# Should only trigger when Player enters Portal
func _on_Area2D_body_entered(body):
	# Advance to the next level
	get_tree().call_group("GameState", "advance_level")
