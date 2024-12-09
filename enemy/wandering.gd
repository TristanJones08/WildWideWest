extends State

@onready var navigation_agent_2d = $"../../NavigationAgent2D"
var wandering_radius = 200

var random_position_in_radius

func enter(msg = {}) -> void:
	move_to_next_random_location()

func move_to_next_random_location():
	random_position_in_radius = get_random_position_in_radius(wandering_radius)