extends Area2D

	

func _ready():
	connect("body_entered", _on_body_entered)  # Ensure the signal is connected
	add_to_group("bricks")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Ensure only the player can destroy it
		queue_free()  # Remove the brick
		await get_tree().create_timer(0.0001).timeout  # ⏳ Tiny delay
