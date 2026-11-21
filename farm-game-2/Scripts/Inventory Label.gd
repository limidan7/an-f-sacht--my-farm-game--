extends Label
var Name = self.name

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = self.name
	visible = true
	z_index = 1
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
