extends Panel

var onPaw = false
var timeRemaining = 10
var coins = 0;

signal gameOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$paw.position = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("Esc"):
		get_tree().quit()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$paw.play("paw")

var bug_scene = preload("res://files/bug.tscn")

func spawn_bugs():
	var bug_instance = bug_scene.instantiate()
	var screen_size = get_viewport_rect().size
	
	bug_instance.position = Vector2(
		randf_range(0, screen_size.x),
		randf_range(50, screen_size.y)
	)
	
	get_parent().add_child(bug_instance)
	bug_instance.clickedBug.connect(_on_bug_clicked_bug)

func _on_timer_timeout() -> void:
	timeRemaining -= 1
	$"../Time".text = "Time " + str(timeRemaining) # Replace with function body.
	spawn_bugs()
	if timeRemaining == 0:
		$paw.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$"../Timer".stop()
		$"../Time".text = "Game Over!" #emit to game over screen
		$"../EndGame".update_score(coins)
		$"../EndGame".show()
		get_tree().call_group("bugs", "queue_free")
		


func _on_bug_clicked_bug(increment) -> void:
	if not increment:
		coins -= 1
		Coins.coins -= 1
	else:
		coins += 1 # Replace with function body.
		Coins.coins += 1
	$"../Score".text = str("Coins: " + str(coins))
