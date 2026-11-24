extends Node2D

func _ready():
	print("SPAWNER IS RUNNING")

	var chicken_scene = preload("res://Scenes/chicken.tscn")

	for i in range(5):
		var chicken = chicken_scene.instantiate()
		add_child(chicken)
		print("Chicken added: ", i)
