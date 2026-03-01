extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.


func show_coins(coins):
	$CoinLabel.text = str(coins)
