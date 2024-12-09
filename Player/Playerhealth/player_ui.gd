extends CanvasLayer

class_name PlayerUI

@onready var health_bar = $MarginContainer/healthbar

func set_health_bar_max_value(max_value: int):
	health_bar.max_value = max_value
	
func update_health_bar_value(health: int):
	health_bar.value = health