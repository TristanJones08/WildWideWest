extends CharacterBody2D
class_name Player

@export var inv: Inv

@onready var actionable_finder: Area2D = $Directions/ActionableFinder

const SPEED = 100.0
var current_dir = "none"
func _ready():
	$AnimatedSprite2D.play("idle")

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size > 0:
			actionables[0].action()
			return

func _physics_process(delta):
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


func _on_actionable_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
