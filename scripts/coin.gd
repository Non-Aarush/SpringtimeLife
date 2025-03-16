extends Area2D

@onready var anim = $AnimatedSprite2D
@export var value: int = 1

func _ready():
	anim.play("coin")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.coin_collected(value)
		queue_free()
