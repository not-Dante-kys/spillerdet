extends Area2D

@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../../player"


func _on_body_entered(body: Node2D) -> void:
	player.take_dmg()
	print("dmg")
