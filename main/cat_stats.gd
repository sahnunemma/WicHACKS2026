extends Node

var FOOD_DECAY_RATE = 0.01
var DRINK_DECAY_RATE = 0.01
var BATH_DECAY_RATE = 0.01
var HAPPY_DECAY_RATE = 0.01
var SLEEP_DECAY_RATE = 0.01

var onSponge = false
var happyPressed = false

var cursor = load("res://main/cursebathe.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Panel/Food/FoodProgress".value = Stats.food
	$"../Panel/Water/WaterProgress".value = Stats.drink
	$"../Panel/Bathe/BatheProgress".value = Stats.bath
	$"../Panel/Happiness/HappinessProgress".value = Stats.happy
	$"../Panel/Sleep/SleepProgress".value = Stats.sleep
	$"../BetterCoin/NumCoins".text = "%d" % Coins.coins

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Stats.food -= FOOD_DECAY_RATE
	Stats.drink -= DRINK_DECAY_RATE
	Stats.bath -= BATH_DECAY_RATE
	Stats.happy -= HAPPY_DECAY_RATE
	Stats.sleep -= SLEEP_DECAY_RATE
	
	if Stats.food <= 0 || Stats.bath <= 0 || Stats.drink <= 0 || Stats.happy <= 0|| Stats.sleep <= 0:
		#switch to ending screen
		get_tree().change_scene_to_file("res://FinalGameOver.tscn")
	if Stats.sleep < 100 && $".".frame == 3:
		Stats.sleep += 4*SLEEP_DECAY_RATE
	elif Stats.food < 25 || Stats.bath < 25 || Stats.drink < 25 || Stats.happy < 25 || Stats.sleep < 25:
		$".".frame = 2
	elif Stats.food < 75 || Stats.bath < 75 || Stats.drink < 75 || Stats.happy < 75 || Stats.sleep < 75:
		$".".frame = 1
	else:
		$".".frame = 0
	
	$"../Panel/Food/FoodProgress".value = Stats.food
	$"../Panel/Water/WaterProgress".value = Stats.drink
	$"../Panel/Bathe/BatheProgress".value = Stats.bath
	$"../Panel/Happiness/HappinessProgress".value = Stats.happy
	$"../Panel/Sleep/SleepProgress".value = Stats.sleep
	$"../BetterCoin/NumCoins".text = "%d" % Coins.coins
	
func _on_sleep_2_pressed() -> void:
	if not onSponge:
		if $".".frame == 3:
			$".".frame = 0
			if $"../DressUp_Menu/WearWings".button_pressed && Stats.wings:
				$"../ButterflyWings".visible = true
			if $"../DressUp_Menu/WearSkirt".button_pressed && Stats.skirt:
				$"../Skirt".visible = true
			if $"../DressUp_Menu/WearCrown".button_pressed && Stats.crown:
				$"../Crown".visible = true
		else:
			$".".frame = 3
			$"../ButterflyWings".visible = false
			$"../Skirt".visible = false
			$"../Crown".visible = false



func _on_play_2_pressed() -> void:
	if not happyPressed and not onSponge and $".".frame != 3:
		happyPressed = true
		Stats.happy += 10 # Replace with function body.
		if Stats.happy > 100:
			Stats.happy = 100
		$"../Heart".visible = true
		await get_tree().create_timer(3.0).timeout
		$"../Heart".visible = false
		await get_tree().create_timer(2.0).timeout
		happyPressed = false


func _on_bathe_2_pressed() -> void:
	if $".".frame != 3:
		if not onSponge:
			Input.set_custom_mouse_cursor(cursor)
			onSponge = true
		else:
			Input.set_custom_mouse_cursor(null)
			onSponge = false
		if Stats.bath > 100:
				Stats.bath = 100

func _on_games_2_pressed() -> void:
	get_tree().change_scene_to_file("res://buffer.tscn")


func _on_area_2d_mouse_entered() -> void:
	if onSponge:
		var bubbles = Sprite2D.new()
		bubbles.texture = load("res://main/bubble.png")
		var mouse_pos = get_viewport().get_mouse_position()
		bubbles.position = Vector2(mouse_pos.x-860,mouse_pos.y-540)
		add_child(bubbles)
		Stats.bath += 1
		await get_tree().create_timer(3.0).timeout
		bubbles.queue_free()
