extends Area2D

@onready var timer: Timer = $Timer

var health = 3

func _on_body_entered(body: Node2D) -> void:
	health =-1
	if health < 0:
		print("you died") 
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
