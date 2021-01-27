extends Area2D


# Should only trigger when Player enters SpikeTop body
func _on_SpikeTop_body_entered(body):
	get_tree().call_group("GameState", "hurt")
