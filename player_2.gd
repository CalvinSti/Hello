extends CharacterBody2D

@export var speed: float = 250.0  # Movement speed

func _ready():
	add_to_group("player")
	velocity = Vector2(-200, -200).normalized() * speed  # Set initial movement

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())  # Bounce off walls

func bounce_off_brick(brick_position: Vector2) -> void:
	var bounce_direction = (global_position - brick_position).normalized()
	velocity = velocity.bounce(bounce_direction)  # ✅ Force the bounce
