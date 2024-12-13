extends StaticBody2D

@export var item: InvItem
var player = null



func _on_interactable_area_body_entered(body: Node2D) -> void:
	print("lost item entered")
	if body is Player:
		player = body
		playercollect()

func playercollect():
	player.collect(item)
