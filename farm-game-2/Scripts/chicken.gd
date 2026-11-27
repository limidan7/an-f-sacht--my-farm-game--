
extends CharacterBody2D

@onready var timer = $Timer
@onready var Player = $"../"
var is_acting = false
var speed = 50.0

var min_x = 80
var max_x = 1100
var min_y = 50
var max_y = 580


func _ready() -> void:
	randomize()
	randspawn()
	if position.x > 870 and position.y > 420:
		randspawn()
	set_deferred("disabled", true)
	randaction()
	$AnimatedSprite2D.scale = Vector2(1,1)


func randspawn():
	var randomx = randi_range(min_x, max_x)
	var randomy = randi_range(min_y, max_y)

	position = Vector2(randomx, randomy)


func randaction():
	if is_acting:
		return

	is_acting = true

	var action = randi_range(0, 3)

	match action:
		0:
			await idle()
		1:
			await walk_left()
		2:
			await walk_right()
		3:
			await randpos()

	is_acting = false
	randaction()


func idle():
	
	$AnimatedSprite2D.play("Idle")
	timer.start(2)
	await timer.timeout


func walk_left():
	var walkdistance = randi_range(100, 400)
	var target = max(position.x - walkdistance, min_x)
	$AnimatedSprite2D.flip_h = true
	

	while position.x > target:
		$AnimatedSprite2D.play("default")
		velocity.x = -speed
		flipcheck()
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO


func walk_right():
	var walkdistance = randi_range(100, 400)
	var target = min(position.x + walkdistance, max_x)
	$AnimatedSprite2D.flip_h = false
	

	while position.x < target:
		$AnimatedSprite2D.play("default")
		velocity.x = speed
		flipcheck()
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO


func randpos():
	var targetx = randf_range(min_x, max_x)
	var targety = randf_range(min_y, max_y)

	
	while position.distance_to(Vector2(targetx, targety)) > 5:
		var direction = (Vector2(targetx, targety) - position).normalized()
		$AnimatedSprite2D.play("default")
		velocity = direction * speed
		flipcheck()
		move_and_slide()

		await get_tree().physics_frame

	velocity = Vector2.ZERO
	
func randspawndir():
	var gimp = randf_range(0,1)
	match gimp:
		0:
			$AnimatedSprite2D.flip_h = true
		1:
			$AnimatedSprite2D.flip_h = false
	
	
func flipcheck():
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		
func seeds(delta):
	print("Seeds function is running")
	$AnimatedSprite2D.scale = Vector2(3,3)s

func _physics_process(delta: float) -> void:
	if Global.seed == true:
		seeds(delta)
	else:
		$AnimatedSprite2D.scale = Vector2(1,1)
	
	
