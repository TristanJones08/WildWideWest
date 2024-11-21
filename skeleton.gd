<<<<<<< HEAD
=======
extends CharacterBody2D
>>>>>>> f445eaa466bbd21b4cf5114aadb5ad2c91429fec

var speed = 80
var player_chase = false
var player = null

<<<<<<< HEAD
=======
func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed

		if(player.position.x - position.x) < 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
>>>>>>> f445eaa466bbd21b4cf5114aadb5ad2c91429fec
