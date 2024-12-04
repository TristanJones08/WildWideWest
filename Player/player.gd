extends CharacterBody2D

class_name Player

const SPEED = 100.0
var current_dir = "none"

@onready var health_system = $HealthSystem as HealthSystem

@export var player_ui: PlayerUI

func _ready():
	player_ui.set_health_bar_max_value(health_system.base_health)
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)

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

func take_damage(damage: int):
	health_system.take_damage(damage)
	player_ui.update_health_bar_value(health_system.current_health)
