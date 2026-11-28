extends Area2D
class_name Chicken
@onready var axe_detect = $"../../../Player/AXE_DETECT"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area is Player_axe and axe_detect.checking:
		print("is_hit")
		print(self.name)
	else:
		print("Im not hit")
	
