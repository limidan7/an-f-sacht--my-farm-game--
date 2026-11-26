extends CharacterBody2D

@onready var Staminacheckervariable = $Stamina
@onready var Stamina = $Stamina
var tool = Global.Tool
@onready var Sprite =  $AnimatedSprite2D
const SPEED = 150
var movable 


func _ready() -> void:
	
	
	movable = true
	Sprite.play("Idle")

func _physics_process(delta: float) -> void:
	
	Tool_select()
	if movable == true:
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = SPEED * direction
		if Input.is_action_pressed("shift"):
			if Global.stamina > 0 and Staminacheckervariable.regencap == false:#checks if theres staminaa and if the regencap is active or not before sprinting
				velocity *= 1.7
				Stamina.is_sprinting = true#Speeds up the character and sets the spriting varaibale
				print("velocity is 1.7x", velocity)
		else:
			Stamina.is_sprinting = false
			print("velocity is normal", velocity)
			
		move_and_slide()
		animation()
		Click()

func animation():
	if movable == true:#plays walking animations based on velocity 
		if velocity.y > 0:
			Sprite.play("walk_down")
		elif velocity.y < 0:
			Sprite.play("walk_up")
		elif velocity.x > 0:
			Sprite.play("walk_right")
		elif velocity.x < 0:
			Sprite.play("walk_left")
		else:
			Sprite.play("Idle")

func Click():
	if Input.is_action_just_pressed("Click") and Global.Tool != null:
		movable = false

		if Global.Tool == "shovel":
			Sprite.play("Shovel_front")
		elif Global.Tool == "watering_can":
			Sprite.play("Watering_Can_front")
		elif Global.Tool == "axe":
			Sprite.play("Axe_front")

		await Sprite.animation_finished
		movable = true
		Global.Tool = null#plays animations based on what TOol is selected rn and stops the player from moving in the animation . Then resets the tool variable
		
		

func Tool_select():
		if Input.is_action_just_pressed("1"):
			Global.Tool = "watering_can"
		elif Input.is_action_just_pressed("2"):
			Global.Tool = "axe"# sets tool based on button pressing
		elif Input.is_action_just_pressed("3"):
			Global.Tool = "shovel"



	
