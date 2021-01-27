extends KinematicBody2D


const SPEED = 1500
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 5000
const WORLD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.5

# Holds motion of Player
var motion = Vector2(0, 0)

signal animate


# Triggered continuously
func _physics_process(delta):
	# Sets up gravity and handles game over from falling out of the world
	apply_gravity()
	# Sets up jumping
	jump()
	# Sets up horizontal movement
	move()
	# Animates Player
	animate()
	# Actally handles motion
	move_and_slide(motion, UP)


# Triggered contiuously as part of physics
func apply_gravity():
	# Check if we need to game over
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "game_over")

	# If Player is on floor and moving down, stop moving down
	elif is_on_floor():
		if motion.y > 0:
			motion.y = 0
	else:
		# If Player is on ceiling, stop excess upwards momentum
		if is_on_ceiling():
			motion.y = 0
		
		# Since player is not on floor, move down
		motion.y += GRAVITY


# Triggered contiuously as part of physics
func jump():
	# If player is pressing the jump button and Player is on floor, set the motion upward and play jump sound
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = -JUMP_SPEED
		$JumpSFX.play()


# Triggered contiuously as part of physics
func move():
	# If Player should go left, go left
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	# If Player should go right, go right
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	# If neither left nor right are pressed, or if both are pressed, do nothing
	else:
		motion.x = 0


# Triggered contiuously as part of physics
func animate():
	# Offload the hadling of the animation to the PlayerAnimation script
	emit_signal("animate", motion)


# Triggered when something damages Player
func hurt():
	# Get off the floor to avoid a bug with not bouncing up on hurt
	position.y -= 1
	# Done in the Udemy class to prevent bug mentioned above, but it doesn't appear to be needed...
#	yield(get_tree(), "idle_frame")

	# Set upward knockback motion and play damage sound
	motion.y = -JUMP_SPEED
	$PainSFX.play()


# Triggered when Player hits a JumpPad
func boost():
	# Get off the floor to avoid a bug with not bouncing up on hurt
	position.y -= 1
	# Done in the Udemy class to prevent bug mentioned above, but it doesn't appear to be needed...
#	yield(get_tree(), "idle_frame")

	# Launch Player up
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER


