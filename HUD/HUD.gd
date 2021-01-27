extends CanvasLayer
#
#func _ready():
#	$Control/TextureRect/HBoxContainer/HBoxContainer/LifeCount.text = "5"
	
# Triggered whenever coin or life counts are updated
func update_stats_count(lives, coins):
	# Update Life and coin counts
	$Control/TextureRect/HBoxContainer/HBoxContainer/LifeCount.text = lives as String
	$Control/TextureRect/HBoxContainer/HBoxContainer2/CoinCount.text = coins as String
