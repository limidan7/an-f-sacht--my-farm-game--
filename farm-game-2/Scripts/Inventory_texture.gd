extends TextureRect


var selfname = self.name
var tool = str(Global.Tool)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 150


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Selection_inventory()
	
	
func Selection_inventory():
	if selfname == tool:
		modulate.a = 255
	else:
		modulate.a = 150
	
