extends CharacterBody2D

#enum States { AIR = 1, FLOOR, LADDER }
#var state = States.AIR
var on_ladder := false
const SPEED = 500.0
const JUMP_VELOCITY = -800.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var isCrouching = false

func _physics_process(delta: float) -> void:
	print(on_ladder)
	
	#match state:
		#States.AIR:
			#pass
		#States.FLOOR:
			#pass
		#
	
	# Add the gravity.
	if not is_on_floor() or (not on_ladder):
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
	
	# Play animations
	if is_on_floor():
		if Input.is_action_pressed("duck"):
			animated_sprite.play("duck")
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if on_ladder == true:
		animated_sprite.play("climb")

	move_and_slide()


func _on_ladder_checker_body_entered(body: Node2D) -> void:
	on_ladder = true


func _on_ladder_checker_body_exited(body: Node2D) -> void:
	on_ladder = false
