extends Node2D

var screen_size: Vector2 = Vector2(1920, 1080)
signal collect


func _ready() -> void:
	$AnimatedSprite2D.play()

func _on_body_entered(body: Node2D) -> void:
	collect.emit()
	queue_free() # Food disappears after being hit.
	$CollisionShape2D.set_deferred("disabled", true)
	
