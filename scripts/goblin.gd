
class_name Goblin extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")
@onready var hit=$AudioStreamPlayer2D
@export var value:int=25

const speed=500
var direction: Vector2

func _ready():
	anim.play("fly")

func _process(delta):
	if true:
		position.x-=speed*delta
		
		
func health_depleted(value):
	print("Health depleted by:", value)
	# Add any other logic you want here




func _on_goblinn_body_entered(body: Node2D) -> void:
	if body is Player:
		if(GameController.total_health !=25):
			hit.play()
			GameController.health_depleted(value)
			await get_tree().create_timer(1).timeout
			self.queue_free()
		else:
			hit.play()
			self.queue_free()
			get_tree().change_scene_to_file("res://scenes/home.tscn")
			GameController.total_health=125
		
