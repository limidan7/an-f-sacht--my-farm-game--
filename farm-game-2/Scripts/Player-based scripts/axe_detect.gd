extends Area2D
class_name Player_axe
var checking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	axe_detect()
	
	
func axe_detect():
	if Global.Tool == "axe" and Input.is_action_just_pressed("Click"):
		monitoring = true
		checking = true
	else:
		monitoring = false
		
