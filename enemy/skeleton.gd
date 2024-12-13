extends CharacterBody2D


@onready var range = $enemyrange
@export var wander_direction : Node2D

var nearby = null
var speed = 2500
var player_chase = false
var player = null
var health = 100

func _physics_process(delta):
	if player_chase:
		velocity = (player.global_position - self.global_position ).normalized() * delta * speed
	else:
		velocity = wander_direction.direction * delta * speed
	move_and_slide()

	nearby = range.get_overlapping_bodies()
	print(nearby.size())
	for item in nearby:
		print(item.name)
		if item is Player:
			item.take_damage(10)


func _on_dectection_body_entered(body):
	player = body
	player_chase = true


func _on_dectection_body_exited(body):
	player = null
	player_chase = false
