extends KinematicBody2D

var speed: int = 150
var velocity = Vector2.ZERO
var rotation_dir: int = 0
var current_action = null
var bullet_in_flight: bool = false

export var Bullet: PackedScene = preload("res://Bullet.tscn")

func get_input() -> void:
	velocity = Vector2()

	if Input.is_action_pressed("move_right") and (current_action == "move_right" or !current_action):
		velocity.x += 1
		rotation_dir = 90
		current_action = "move_right"
	if Input.is_action_pressed("move_left") and (current_action == "move_left" or !current_action):
		velocity.x -= 1
		rotation_dir = 270
		current_action = "move_left"
	if Input.is_action_pressed("move_up") and (current_action == "move_up" or !current_action):
		velocity.y -= 1
		rotation_dir = 0
		current_action = "move_up"
	if Input.is_action_pressed("move_down") and (current_action == "move_down" or !current_action):
		velocity.y += 1
		rotation_dir = 180
		current_action = "move_down"
	
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_released("move_right") \
	or Input.is_action_just_released("move_left") \
	or Input.is_action_just_released("move_up") \
	or Input.is_action_just_released("move_down"):
		current_action = null
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
		
func shoot() -> void:
	if not bullet_in_flight:
		var bullet = Bullet.instance()
		
		bullet.connect("impacted", self, "_on_Bullet_impacted")
		
		bullet_in_flight = true
		
		if owner:
			owner.add_child(bullet)
			bullet.transform = $BulletSpawn.global_transform
		else:
			add_child(bullet)
			bullet.transform = $BulletSpawn.transform


func _physics_process(delta: float) -> void:
	get_input()
	rotation_degrees = rotation_dir
	velocity = move_and_slide(velocity)
	
func _on_Bullet_impacted() -> void:
	bullet_in_flight = false
