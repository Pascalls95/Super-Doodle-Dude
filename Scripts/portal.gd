extends Area2D


# Called when the node enters the scene tree for the first time.
@onready var sprite = $AnimatedSprite2D
@export_file("*.tscn") var next_level: String
func _ready():
	sprite.play("portal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D):
	if body.name == "Player":
		get_tree().change_scene_to_file(next_level)
		call_deferred("queue_free")
