extends Node

@export var food_scene: PackedScene
var screen_size: Vector2 = Vector2(1900, 1000)
var max_sprites = 0
var 	seconds = 0
var score

func game_over():
	$FoodTimer.stop()
	get_tree().change_scene_to_file("res://game_over.tscn")

func new_game():
	score = 0
	$FoodTimer.start()
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	get_tree().call_group("mobs", "queue_free")

func _on_food_timer_timeout():
	# Create a new instance of the food scene.
	var food = food_scene.instantiate()
	
	# Set the food's position to the random location.
	food.position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))

	# Spawn the food by adding it to the Main scene.
	if max_sprites < 5:
		add_child(food)
		food.collect.connect(_on_food_collect) 
		max_sprites += 1

func _on_start_timer_timeout() -> void:
	seconds += 1
	$HUD.show_timer(seconds)
	if seconds > 60:
		game_over()
		

func _on_food_collect() -> void:
	score += 1
	$HUD.update_score(score)
