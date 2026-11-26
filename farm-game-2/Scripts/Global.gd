extends Node

var Tool
var stamina:float = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Tool = null #my tool variable
	stamina = 100 # my stamina variable

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
