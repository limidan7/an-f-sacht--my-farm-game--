extends Node

var seed
var Tool
var stamina:float 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Tool = null #my tool variable
	stamina = 500 # my stamina variable
	seed = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
