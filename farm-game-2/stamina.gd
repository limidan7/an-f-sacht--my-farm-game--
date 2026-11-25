extends Node

@onready var stamina = Global.stamina
var drain_rate = 40
var regen_rate = 10
var max_stamina:float = 100
var is_sprinting :bool 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_sprinting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_sprinting:
		Global.stamina -= drain_rate * delta
		print("stamina")
	else:
		Global.stamina += regen_rate * delta
		
	Global.stamina = clampf(Global.stamina, 0.0, max_stamina)
