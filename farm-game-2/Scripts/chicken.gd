
extends CharacterBody2D

@onready var timer = $Timer

var is_acting = false
var speed = 50.0

func _ready() -> void:
	randomize()
	randspawn()
	print(position)
	print("spawned")
	
	randspawner()


func randspawn():
	var randomx = randi_range(80, 1100)
	var randomy = randi_range(50, 600)
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
	timer.start(2)
	await timer.timeout


func walk_left():
	var walkdistance = randi_range(100, 400)
	var target = position.x - walkdistance

	print("walking_left", walkdistance, self.name)

	while position.x > target:
		velocity.x = -speed
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO


func walk_right():
	var walkdistance = randi_range(100, 400)
	var target = position.x + walkdistance

	print("walking_right ", walkdistance, self.name)

	while position.x < target:
		velocity.x = speed
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO


func randpos():
	var targetxdistance = randi_range(100, 500)
	var targetydistance = randi_range(100, 500)

	var targety = position.y + targetydistance
	var targetx = position.x + targetxdistance

	print("randpos ", targetxdistance, targetydistance, self.name)

	while position.x < targetx and position.y < targety:
		velocity.x = speed
		velocity.y = speed
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO
