extends Button

@onready var Player = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.SPEED = 150


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_toggled(toggled_on: bool) -> void:
	var PlayerSpeed = Player.SPEED
	Player.SPEED *= 1.5
	print(Player.SPEED)
