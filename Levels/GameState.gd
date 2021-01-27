extends Node2D

var lives = 5
var coins = 0
var coins_per_life = 5
var current_level = 1

const LEVEL_COUNT = 1


func _ready():
	# Listen to group GameState and initialize the HUD
	add_to_group("GameState")
	update_HUD()


# Triggered when Player takes damage
func hurt():
	# Decrease lives, run the player update method, update the HUD, and check if game over
	lives -= 1
	# Gives the player knockback and plays the hurt sound
	$Player.hurt()
	update_HUD()
	if lives < 0:
		game_over()
	# Debug
	print(lives)


# Triggered whenever life or coin counts change
func update_HUD():
	# Updates HUD with new number of lives and coins
		get_tree().call_group("HUD", "update_stats_count", lives, coins)


# Triggered when Player collects a coin
func coin_up():
	# Add one to coin count, increase lives by one if there are enough coins, and then update the HUD
	coins += 1
	if coins % coins_per_life == 0:
		lives += 1
	update_HUD()


# Triggered when lives hits zero or when Player falls below the level
func game_over():
	get_tree().change_scene("res://Levels/GameOver.tscn")


# Triggered when Player comes into contact with a portal to the next level
func advance_level():
	# If we just beat the final level
	if current_level == LEVEL_COUNT:
		win_game()
	else:
		#TODO: add code once there are multiple levels
		pass


# Triggered when Player touches the portal on the last level
func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")








