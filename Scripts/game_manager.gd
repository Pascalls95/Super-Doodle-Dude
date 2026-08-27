extends Node

var score = 0
var lives = 3
var next_extra_life = 500

func add_score(points: int):
	score += points
	
	while score >= next_extra_life:
		lives += 1
		next_extra_life += 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
