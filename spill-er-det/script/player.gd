extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var kill_timer: Timer = $kill_timer
@onready var hurt_timer: Timer = $hurt_timer

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var health = 5
var hurt: bool = false

func take_dmg():
	if hurt:
		print("nuh uh")
	else:
		health = health - 1
		print("dmg")
		hurt = true
		print("hurt")
		hurt_timer.start()
	if health < 1:
		print("you died") 
		Engine.time_scale = 0.5
		get_node("CollisionShape2D").queue_free()
		kill_timer.start()
		print(health)

func _on_hurt_timer_timeout() -> void:
	hurt = false
	print ("yuh uh")

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print("jump")
		
	# Get the input direction: -1 0 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	#apply animation
	if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	#apply movment
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



	pass # Replace with function body.
