extends Area2D


# Called when the node enters the scene tree for the first time.
@onready var sprite = $AnimatedSprite2D
func _ready():
	sprite.play("spin")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body):
	if body.name == "Player":
		GameManager.add_score(10)
		body.update_score()
		body.update_lives()
		queue_free()
	
