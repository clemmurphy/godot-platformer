extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	
	# Play runnning or default animation
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = 'running'
	else:
		sprite_2d.animation = 'default'
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		# Handle jumping and falling animations
		if velocity.y < 0:
			sprite_2d.animation = 'jumping'
		else:
			sprite_2d.animation = 'falling'
			
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
		# Flip sprite depending on direction
		if velocity.x > 0:
			sprite_2d.flip_h = false
		if velocity.x < 0:
			sprite_2d.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, 25)

	move_and_slide()
