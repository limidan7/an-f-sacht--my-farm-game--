extends Node

var Tool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Tool = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Tool_select()

func Tool_select():
	if Input.is_action_just_pressed("1"):
		Tool = "watering_can"
	elif Input.is_action_just_pressed("2"):
		Tool = "axe"
	elif Input.is_action_just_pressed("3"):
		Tool = "shovel"
