extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "%d" % Coins.coins


func _on_blueberry_pressed() -> void:
	if Coins.coins >= 10:
		Coins.coins -= 10
		Stats.blueberries += 1


func _on_fish_pressed() -> void:
	if Coins.coins >= 15:
		Coins.coins -= 15
		Stats.fish += 1


func _on_treat_pressed() -> void:
	if Coins.coins >= 20:
		Coins.coins -= 20
		Stats.treat += 1


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main/home.tscn")


func _on_water_pressed() -> void:
	if Coins.coins >= 10:
		Coins.coins -= 10
		Stats.water += 1


func _on_milk_pressed() -> void:
	if Coins.coins >= 15:
		Coins.coins -= 15
		Stats.milk += 1


func _on_doccy_p_pressed() -> void:
	if Coins.coins >= 20:
		Coins.coins -= 20
		Stats.doccyp += 1


func _on_window_pressed() -> void:
	if Coins.coins >= 25 && not Stats.window:
		Coins.coins -= 25
		Stats.window = true


func _on_sunflower_pressed() -> void:
	if Coins.coins >= 50 && not Stats.sunflower:
		Coins.coins -= 50
		Stats.sunflower = true


func _on_yarn_pressed() -> void:
	if Coins.coins >= 75 && not Stats.yarn:
		Coins.coins -= 75
		Stats.yarn = true
