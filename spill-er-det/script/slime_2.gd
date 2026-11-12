extends CharacterBody2D

var speed = 60
var direction = 1

@onready var ray_cast_left: RayCast2D = $ray_cast_left
@onready var ray_cast_right: RayCast2D = $ray_cast_right
@onready var Animated_Sprite = $AnimatedSprite2D


#adds gravity
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()


#switches direction when about to collide with wall
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		Animated_Sprite.flip_h = false
	
	if ray_cast_right.is_colliding():
		direction = -1
		Animated_Sprite.flip_h = true
	
	position.x += direction * speed * delta
