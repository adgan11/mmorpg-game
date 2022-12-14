extends KinematicBody2D

export var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	if velocity != Vector2.ZERO:
		$AnimatedSprite.set_animation("move")
	else:
		$AnimatedSprite.set_animation("idle")
	velocity = move_and_slide(velocity)
