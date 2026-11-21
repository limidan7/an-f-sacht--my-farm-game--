extends CharacterBody2D

@onready var Sprite =  $AnimatedSprite2D
const SPEED = 300.0
var movable 

func _ready() -> void:
	movable = true
	Sprite.play("idle")





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
	if Input.is_action_just_pressed("Click"):
		movable = false
		Sprite.play("Click")
		await Sprite.animation_finished
		movable = true
		

	
	
	
