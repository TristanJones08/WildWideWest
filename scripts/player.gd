extends CharacterBody2D
class_name Player

@onready var invulnerable_timer = $"invulnerable timer"
const SPEED = 100.0
var current_dir = "none"
var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var allow_damage = true

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)
	print(health)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		play_anim(1)
		current_dir="right"
		velocity.x=SPEED
		velocity.y=0
	elif Input.is_action_pressed("ui_left"):
		play_anim(1)
		current_dir="left"
		velocity.x=-SPEED
		velocity.y=0
	elif Input.is_action_pressed("ui_down"):
		play_anim(1)
		current_dir="down"
		velocity.x=0
		velocity.y=SPEED
	elif Input.is_action_pressed("ui_up"):
		play_anim(1)
		current_dir = "up"
		velocity.x=0
		velocity.y=-SPEED
	else:
		play_anim(0)
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
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walking")
		elif movement == 0:
			anim.play("idle")
@export var inv: Inv

	
func take_damage(amount):
	if allow_damage == true:
		allow_damage = false
		health -= amount
		$HealthBar.value = health
		invulnerable_timer.stop()
		invulnerable_timer.start()
		

func _on_invulnerable_timer_timeout():
	allow_damage = true
