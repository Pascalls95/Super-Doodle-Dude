extends Area2D

@onready var sprite = $AnimatedSprite2D
@export var destination: Marker2D
func _ready() -> void:
	sprite.play("portal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and destination:
		body.global_position = destination.global_position
		body.velocity = Vector2.ZERO
	pass # Replace with function body.
