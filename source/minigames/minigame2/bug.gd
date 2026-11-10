extends Area2D
var bugs = ["bug1", "bug2", "bug3", "fish"]
var increment

signal clickedBug

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	$enemies_paw.play(bugs.pick_random())
	increment = true

func _input_event(viewport, event, shape_idx):
	#call coins to add one
	if event is InputEventMouseButton and event.pressed:
		if $"enemies_paw".animation == "fish":
			increment = false
		#else:
		#	increment = true
		queue_free()
		clickedBug.emit(increment)
