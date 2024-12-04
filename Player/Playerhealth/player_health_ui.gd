extends CanvasModulate
class_name = PlayerUiI

@onready var health_bar = $MarginContainer/healthbar

func set_life_bar_value(max_value: int):
	health_bar.max_value = max_value

func update_life_bar_value(life: int):
	health_bar.value = health