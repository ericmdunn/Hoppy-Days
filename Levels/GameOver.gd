extends Control



# When the player clicks on the button, restart the game
func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
	
# When the player presses ui_accept, restart the game
func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Levels/Level1.tscn")


