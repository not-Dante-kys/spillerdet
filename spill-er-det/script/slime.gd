extends Node2D

const speed = 60

var direction = 1



@onready var ray_cast_left: RayCast2D = $"ray cast left"

@onready var ray_cast_right: RayCast2D = $"ray cast right"

@onready var Animated_Sprite = $AnimatedSprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		Animated_Sprite.flip_h = false
	
	if ray_cast_right.is_colliding():
		direction = -1
		Animated_Sprite.flip_h = true
	
	position.x += direction * speed * delta
