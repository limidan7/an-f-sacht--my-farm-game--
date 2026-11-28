
extends CharacterBody2D
var is_seeds
@onready var timer = $Timer
@onready var Player = $"../../Player"
var is_acting = false
var speed = 200

var min_x = -1840
var max_x = 2350
var min_y = -710
var max_y = 1400


func _ready() -> void:
	randomize()
	randspawn()
	if position.x > 870 and position.y > 420:
		randspawn()
	$CollisionShape2D.disabled = true
	randaction()
	$AnimatedSprite2D.scale = Vector2(1,1)



func randspawn():
	var randomx = randi_range(min_x, max_x)
	var randomy = randi_range(min_y, max_y)

	position = Vector2(randomx, randomy)


func randaction():
	if Global.seed == false:
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
	

	while position.x > target and Global.seed == false:
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
	

	while position.x < target and Global.seed == false:
		$AnimatedSprite2D.play("default")
		velocity.x = speed
		flipcheck()
		move_and_slide()
		await get_tree().physics_frame

	velocity = Vector2.ZERO


func randpos():
	var targetx = randf_range(min_x, max_x)
	var targety = randf_range(min_y, max_y)

	
	while position.distance_to(Vector2(targetx, targety)) > 5 and Global.seed == false:
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
	if global_position != Player.global_position:
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = false
	
		
func seeds(delta):
	is_seeds = true
	
	var disttoplayer = global_position.distance_to(Player.global_position)
	var dirtoplayer = global_position.direction_to(Player.global_position)
	velocity = (dirtoplayer*speed)
	$CollisionShape2D.disabled = false
	if Player.global_position == global_position:
		$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.play("default")
		$CollisionShape2D.disabled = true
	move_and_slide()
	
	
func _physics_process(delta: float) -> void:
	if Global.seed == true:
		seeds(delta)
		$AnimatedSprite2D.play("default")
		if Player.position.x > position.x:
			$AnimatedSprite2D.flip_h = false
		elif Player.position.x < position.x:
			$AnimatedSprite2D.flip_h = true
	elif is_acting == false:
		randaction()
		$AnimatedSprite2D.scale = Vector2(1,1)
	else:
		$AnimatedSprite2D.scale = Vector2(1,1)
		
	
	
