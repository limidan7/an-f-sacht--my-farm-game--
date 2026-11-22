extends TextureRect


@onready var selfname = self.name
var tool 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tool = Global.Tool
	Selection_inventory()
	
func Selection_inventory():
	if selfname == tool:
		modulate.a = 1.0
	else:
		modulate.a = 0.5
	
