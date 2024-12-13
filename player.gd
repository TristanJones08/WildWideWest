extends CharacterBody2D
class_name Player

@export var inv: Inv

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var gun = $Gun
var direction = Vector2.ZERO

const SPEED = 100.0
var current_dir = "none"
func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		gun.shoot()
	if direction != Vector2.ZERO:
		gun.setup_direction(direction)
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir="right"
		velocity.x=SPEED
		velocity.y=0
		
	elif Input.is_action_pressed("ui_left"):
		current_dir="left"
		
		velocity.x=-SPEED
		velocity.y=0
	elif Input.is_action_pressed("ui_down"):
		current_dir="down"
		velocity.x=0
		velocity.y=SPEED
	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		velocity.x=0
		velocity.y=-SPEED
		
	else: 
		velocity.x=0
		velocity.y=0
		
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D

	if dir == "right":
		anim.flip_h = false
	if movement == 1:
		anim.play("walking")
	elif movement == 0:
		anim.play("idle")

func player():
	pass

func collect (item):
	inv.insert(item)
