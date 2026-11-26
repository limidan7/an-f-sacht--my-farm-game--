
extends CharacterBody2D

@onready var timer = $Timer
@onready var Player = $"../Player"
var is_acting = false
var speed = 50.0

var min_x = 80
var max_x = 1100
var min_y = 50
var max_y = 580


func _ready() -> void:

	randomize()
	randspawn()
	print(position)
	print("spawned")
	if position.x > 870 and position.y > 420:
		randspawn()

	randspawner()


func randspawn():
	var randomx = randi_range(min_x, max_x)
	var randomy = randi_range(min_y, max_y)

	position = Vector2(randomx, randomy)


func randspawner():
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
	randspawner()


func idle():
	print("idle", self.name)
	$AnimatedSprite2D.play("Idle")
	timer.start(2)
	await timer.timeout


func walk_left():
	var walkdistance = randi_range(100, 400)
	var target = max(position.x - walkdistance, min_x)
	$AnimatedSprite2D.flip_h = true
	print("walking_left", walkdistance, self.name)

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
	print("walking_right", walkdistance, self.name)

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

	print("randpos ", targetx, targety, self.name)

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
	print(gimp, "random flip")
	
func flipcheck():
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		
func seeds(delta):
	if Global.seed == true:
		while Player.position.x > position.x and Player.position.y > position.y:
			position.x += 10 * delta
			position.y += 10 * delta

func _physics_process(delta: float) -> void:
	seeds(delta)
	
