extends CharacterBody2D


var tool = Global.Tool
@onready var Sprite =  $AnimatedSprite2D
const SPEED = 300.0
var movable 

func _ready() -> void:
	movable = true
	Sprite.play("Idle")





func _physics_process(delta: float) -> void:
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
	if Input.is_action_just_pressed("Click") and tool != null:
		movable = false
		if tool == "shovel":
			Sprite.play("Shovel_front")
		elif tool == "watering_can":
			Sprite.play("Watering_Can _front")
		elif tool == "axe":
			Sprite.play("Axe_front")
		await Sprite.animation_finished
		tool = null
		movable = true
		print("worked")
		

		

	
	
	
