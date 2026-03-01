extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


func show_coins(coins):
	$CoinLabel.text = str(coins)


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main/home.tscn")
