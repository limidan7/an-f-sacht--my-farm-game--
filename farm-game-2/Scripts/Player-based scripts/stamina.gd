extends Node

@onready var stamina = Global.stamina
var drain_rate = 20
var regen_rate = 5
var max_stamina:float = 500
var is_sprinting :bool 
var regencap:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_sprinting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_sprinting:# checks if the player is sprinting and drains stamina accordingly , otherwise the player regens 
		Global.stamina -= drain_rate * delta
	else:
		Global.stamina += regen_rate * delta
		
	Global.stamina = clampf(Global.stamina, 0.0, max_stamina)# makes the stamina unable to go above 100 or below 0
	sprintthingy()
	regenzero()
	regenuncap()
func sprintthingy():
	if Input.is_action_pressed("shift") != true:
		is_sprinting = false
		
func regenzero():
	if Global.stamina == 0:
		regencap = true
	# sets regencap so you cant inf sprint without a cooldown
func regenuncap():
	if Global.stamina > 40:
		regencap = false
	
