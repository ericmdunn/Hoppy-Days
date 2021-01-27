extends Node2D

const SPEED = 300


# When it spawns in; none should be initialized at level start
func _ready():
	# Make self's position independent of its parent but start it at the same location as parent
	set_as_toplevel(true)
	global_position = get_parent().global_position


# triggered continuosly
func _process(delta):
	# Move downward at speed SPEED, then check for collision
	position.y += SPEED * delta
	manage_collision()


# Triggered continuously
func manage_collision():
	# If it collides with Player, hurt player. If it collides with anything (including player) except coins, destroy it
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		if object.name == "Player":
			get_tree().call_group("GameState", "hurt")
		queue_free()


# Triggered when it goes off screen
func _on_VisibilityNotifier2D_screen_exited():
	# Delete self
	queue_free()


