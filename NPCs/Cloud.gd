extends Node2D

var timeout = false

func _process(delta):
	# The raycast should only be able to collide with player
	if $Sprite/RayCast2D.is_colliding():
		fire()


func fire():
	# Timeout determines if we can fire a lightning bolt again. 
	if not timeout:
		# create a new lightning bolt and set the timer to prevent another one from being created
		$Sprite/RayCast2D.add_child(load("res://NPCs/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true


func _on_Timer_timeout():
	timeout = false










