extends CharacterBody2D

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randspawn()
	print(position)
	print("spawned")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	randspawner()

func randspawn():
	var randomx = randi_range(80, 1100)
	var randomy = randi_range(50, 600)
	position = Vector2(randomx, randomy)
	
	
func randspawner():
	var action = randi_range(0,3)
	
	match action:
		
		0:
			idle()
		1:
			walk_left()
		2:
			walk_right()
		3:
			randpos()
			
			
			
func idle():
	print("idle", self.name)
	await timer.start(2).timeout
	randspawner()
	
func walk_left():
	var walkdistance = randi_range(100, 400)
	var target = position.x - walkdistance
	print("walking_left", walkdistance, self.name)
	while position.x < target:
		velocity.x = -50
		move_and_slide()
	randspawner()
	
func walk_right():
	var walkdistance = randi_range(100, 400)
	var target = position.x + walkdistance
	print("walking_right", walkdistance, self.name)
	while position.x < target:
		velocity.x = 50
		move_and_slide()
	randspawner()

func randpos():
	var targetxdistance = randi_range(100, 500)
	var targetydistance = randi_range(100, 500)
	
	var targety = position.y + targetydistance
	var targetx = position.x + targetxdistance
	print("randpos", targetxdistance, targetydistance, self.name)
	while position.x < targetx and position.y < targety:
		velocity.y = 50
		velocity.x = 50
		move_and_slide()
	randspawner()
	
