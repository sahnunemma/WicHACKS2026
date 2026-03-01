extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"../Food_Drink_Menu/Blueberry/BlueberryLabel".text = "%d blueberries" % Stats.blueberries
	$"../Food_Drink_Menu/Fish/FishLabel".text = "%d fish" % Stats.fish
	$"../Food_Drink_Menu/Treat/TreatLabel".text = "%d treats" % Stats.treat
	$"../Food_Drink_Menu/Water/WaterLabel".text = "%d waters" % Stats.water
	$"../Food_Drink_Menu/Milk/MilkLabel".text = "%d milks" % Stats.milk
	$"../Food_Drink_Menu/DoccyP/DoccyPLabel".text = "%d doccyps" % Stats.doccyp



func _on_decorate_2_pressed() -> void:
	if not $"../Widget".onSponge and $"../Widget".frame != 3:
		$"../Decorate_Menu".visible = true
		
		$"../Decorate_Menu/DisplayWindow".disabled = false
		$"../Decorate_Menu/DisplaySunflower".disabled = false
		$"../Decorate_Menu/DisplayYarn".disabled = false
		
		$"../Buttons/Food_Drink2".disabled = true
		$"../Buttons/Bathe2".disabled = true
		$"../Buttons/Play2".disabled = true
		$"../Buttons/Sleep2".disabled = true
		$"../Buttons/Games2".disabled = true
		$"../Buttons/Store2".disabled = true
		$"../Buttons/Dress Up2".disabled = true
		$"../Buttons/Decorate2".disabled = true


func _on_store_2_pressed() -> void:
	if not $"../Widget".onSponge and $"../Widget".frame != 3:
		get_tree().change_scene_to_file("res://main/store.tscn")


func _on_exit_menu_pressed() -> void:
	$"../MenuBoard".visible = false
	$"../EnterMenu".visible = true
	$"../Buttons/Food_Drink2".disabled = false
	$"../Buttons/Bathe2".disabled = false
	$"../Buttons/Play2".disabled = false
	$"../Buttons/Sleep2".disabled = false
	$"../Buttons/Games2".disabled = false
	$"../Buttons/Store2".disabled = false
	$"../Buttons/Dress Up2".disabled = false
	$"../Buttons/Decorate2".disabled = false
	
	$"../Widget".FOOD_DECAY_RATE = 0.01
	$"../Widget".DRINK_DECAY_RATE = 0.01
	$"../Widget".BATH_DECAY_RATE = 0.01
	$"../Widget".HAPPY_DECAY_RATE = 0.01
	$"../Widget".SLEEP_DECAY_RATE = 0.01


func _on_enter_menu_pressed() -> void:
	if not $"../Widget".onSponge and $"../Widget".frame != 3:
		$"../MenuBoard".visible = true
		$"../EnterMenu".visible = false
		
		$"../Buttons/Food_Drink2".disabled = true
		$"../Buttons/Bathe2".disabled = true
		$"../Buttons/Play2".disabled = true
		$"../Buttons/Sleep2".disabled = true
		$"../Buttons/Games2".disabled = true
		$"../Buttons/Store2".disabled = true
		$"../Buttons/Dress Up2".disabled = true
		$"../Buttons/Decorate2".disabled = true
		
		$"../Widget".FOOD_DECAY_RATE = 0
		$"../Widget".DRINK_DECAY_RATE = 0
		$"../Widget".BATH_DECAY_RATE = 0
		$"../Widget".HAPPY_DECAY_RATE = 0
		$"../Widget".SLEEP_DECAY_RATE = 0
	


func _on_exit_game_pressed() -> void:
	get_tree().quit()


func _on_exit_food_menu_pressed() -> void:
	$"../Food_Drink_Menu".visible = false
	
	$"../Food_Drink_Menu/Blueberry".disabled = true
	$"../Food_Drink_Menu/Fish".disabled = true
	$"../Food_Drink_Menu/Treat".disabled = true
	$"../Food_Drink_Menu/Water".disabled = true
	$"../Food_Drink_Menu/Milk".disabled = true
	$"../Food_Drink_Menu/DoccyP".disabled = true
	
	$"../Buttons/Food_Drink2".disabled = false
	$"../Buttons/Bathe2".disabled = false
	$"../Buttons/Play2".disabled = false
	$"../Buttons/Sleep2".disabled = false
	$"../Buttons/Games2".disabled = false
	$"../Buttons/Store2".disabled = false
	$"../Buttons/Dress Up2".disabled = false
	$"../Buttons/Decorate2".disabled = false
	
	$"../Widget".FOOD_DECAY_RATE = 0.01
	$"../Widget".DRINK_DECAY_RATE = 0.01
	$"../Widget".BATH_DECAY_RATE = 0.01
	$"../Widget".HAPPY_DECAY_RATE = 0.01
	$"../Widget".SLEEP_DECAY_RATE = 0.01


func _on_blueberry_pressed() -> void:
	if Stats.blueberries > 0:
		Stats.blueberries -= 1
		Stats.food += 5
		if Stats.food > 100:
			Stats.food = 100
		_on_exit_food_menu_pressed()


func _on_fish_pressed() -> void:
	if Stats.fish > 0:
		Stats.fish -= 1
		Stats.food += 10
		if Stats.food > 100:
			Stats.food = 100
		_on_exit_food_menu_pressed()

func _on_treat_pressed() -> void:
	if Stats.treat > 0:
		Stats.treat -= 1
		Stats.food += 15
		if Stats.food > 100:
			Stats.food = 100
		_on_exit_food_menu_pressed()

func _on_water_pressed() -> void:
	if Stats.water > 0:
		Stats.water -= 1
		Stats.drink += 5
		if Stats.drink > 100:
			Stats.drink = 100
		_on_exit_food_menu_pressed()

func _on_milk_pressed() -> void:
	if Stats.milk > 0:
		Stats.milk -= 1
		Stats.drink += 10
		if Stats.drink > 100:
			Stats.drink = 100
		_on_exit_food_menu_pressed()

func _on_doccy_p_pressed() -> void:
	if Stats.doccyp > 0:
		Stats.doccyp -= 1
		Stats.drink += 15
		if Stats.drink > 100:
			Stats.drink = 100
		_on_exit_food_menu_pressed()

func _on_food_drink_2_pressed() -> void:
	if not $"../Widget".onSponge and $"../Widget".frame != 3:
		$"../Food_Drink_Menu".visible = true
		
		$"../Food_Drink_Menu/Blueberry".disabled = false
		$"../Food_Drink_Menu/Fish".disabled = false
		$"../Food_Drink_Menu/Treat".disabled = false
		$"../Food_Drink_Menu/Water".disabled = false
		$"../Food_Drink_Menu/Milk".disabled = false
		$"../Food_Drink_Menu/DoccyP".disabled = false
		
		$"../Buttons/Food_Drink2".disabled = true
		$"../Buttons/Bathe2".disabled = true
		$"../Buttons/Play2".disabled = true
		$"../Buttons/Sleep2".disabled = true
		$"../Buttons/Games2".disabled = true
		$"../Buttons/Store2".disabled = true
		$"../Buttons/Dress Up2".disabled = true
		$"../Buttons/Decorate2".disabled = true
		
		$"../Widget".FOOD_DECAY_RATE = 0
		$"../Widget".DRINK_DECAY_RATE = 0
		$"../Widget".BATH_DECAY_RATE = 0
		$"../Widget".HAPPY_DECAY_RATE = 0
		$"../Widget".SLEEP_DECAY_RATE = 0


func _on_display_window_toggled(toggled_on: bool) -> void:
	if Stats.window:
		$"../Window".visible = toggled_on


func _on_display_sunflower_toggled(toggled_on: bool) -> void:
	if Stats.sunflower:
		$"../Sunflower".visible = toggled_on


func _on_display_yarn_toggled(toggled_on: bool) -> void:
	if Stats.yarn:
		$"../Yarn".visible = toggled_on


func _on_exit_decor_menu_pressed() -> void:
	$"../Decorate_Menu".visible = false
	
	$"../Decorate_Menu/DisplayWindow".disabled = true
	$"../Decorate_Menu/DisplaySunflower".disabled = true
	$"../Decorate_Menu/DisplayYarn".disabled = true
	
	$"../Buttons/Food_Drink2".disabled = false
	$"../Buttons/Bathe2".disabled = false
	$"../Buttons/Play2".disabled = false
	$"../Buttons/Sleep2".disabled = false
	$"../Buttons/Games2".disabled = false
	$"../Buttons/Store2".disabled = false
	$"../Buttons/Dress Up2".disabled = false
	$"../Buttons/Decorate2".disabled = false
