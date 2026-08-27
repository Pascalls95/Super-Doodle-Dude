extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var spawn_position = global_position
@onready var score_label = $"../UI/ScoreLabel"
@onready var lives_label = $"../UI/LivesLabel"
const SPEED = 400.0
const JUMP_VELOCITY = -690.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if !is_on_floor():
		if animated_sprite.animation != "jump":
			animated_sprite.play("jump")
	elif direction != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body.has_method("lose_life"):
		body.lose_life()
	pass # Replace with function body.

func update_score():
	score_label.text = "Score: " + str(GameManager.score)

func _ready():
	update_score()
	update_lives()

func update_lives():
	lives_label.text = "Lives: " + str(GameManager.lives)

func lose_life():
	GameManager.lives -= 1
	update_lives()
	if GameManager.lives <= 0:
		GameManager.lives = 3
		GameManager.score = 0
		get_tree().reload_current_scene()
		# insert restart here later
	else:
		respawn()

func respawn():
	global_position = spawn_position
	velocity = Vector2.ZERO



	pass # Replace with function body.
