extends CharacterBody2D

@export var speed: float = 300.0  # Player movement speed

func _ready():
	add_to_group("player")

func _physics_process(_delta):
	var direction = Vector2.ZERO  # Movement vector

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalize direction to avoid diagonal speed boost
	direction = direction.normalized()
	
	# Move the player
	velocity = direction * speed
	move_and_slide()


func _on_brick_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
