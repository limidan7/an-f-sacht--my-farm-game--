extends CharacterBody2D


var tool = Global.Tool
@onready var Sprite =  $AnimatedSprite2D
const SPEED = 175.0
var movable 
signal done

func _ready() -> void:
	
	movable = true
	Sprite.play("Idle")





func _physics_process(delta: float) -> void:
	Tool_select()
	if movable == true:
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = SPEED * direction
		move_and_slide()
		animation()
		Click()
		
	
func animation():
	if movable == true:
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
		Global.Tool = null
		print("worked")
		

func Tool_select():
		if Input.is_action_just_pressed("1"):
			Global.Tool = "watering_can"
		elif Input.is_action_just_pressed("2"):
			Global.Tool = "axe"
		elif Input.is_action_just_pressed("3"):
			Global.Tool = "shovel"
		
	
	
