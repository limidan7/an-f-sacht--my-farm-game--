extends Label

@onready var Staminanode = $"../../Player/Stamina"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(snapped(Global.stamina, 0))
	print(Global.stamina)
	label_settings.font_color = Color.WHITE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(snapped(Global.stamina, 0))#sets text to a string vesion of the stamina variable with the decimal points removed instead of trailing on like this message lol
	regenred()
	
	
func regenred():
	if Staminanode.regencap == true:
		label_settings.font_color = Color.RED#sets label colour based on regencap status
	else:
		label_settings.font_color = Color.WHITE
