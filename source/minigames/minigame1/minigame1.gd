extends Node

@export var food_scene: PackedScene
var screen_size: Vector2 = Vector2(1900, 1000)
var 	seconds = 0
var score

func game_over():
	$FoodTimer.stop()
	$GameOver.show_coins(score)
	$GameOver.show()
	$Player.hide()
	$HUD.hide()
	get_tree().call_group("foods", "queue_free")


func new_game():
	score = 0
	$FoodTimer.start()
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	
	
func _on_food_timer_timeout():
	# Create a new instance of the food scene.
	var food = food_scene.instantiate()
	
	# Set the food's position to the random location.
	food.position = Vector2(randf_range(0, screen_size.x), randf_range(150, screen_size.y))

	# Spawn the food by adding it to the Main scene.
	add_child(food)
	food.collect.connect(_on_food_collect) 

func _on_start_timer_timeout() -> void:
	seconds += 1
	$HUD.show_timer(seconds)
	if seconds > 10:
		game_over()
		

func _on_food_collect() -> void:
	score += 1
	Coins.coins += 1
	$HUD.update_score(score)
