extends Node2D

@export var group_name : String

var positions : Array
var temp_positions :Array
var current_position :Marker2D

var direction :Vector2 = Vector2.ZERO

func _ready():
	positions = get_tree().get_nodes_in_group(group_name)
	get_positions()
	get_next_position()

func _physics_process(_delta):
	if global_position.distance_to(current_position.position) < 10:
		get_next_position()

func get_positions():
	temp_positions = positions.duplicate()
	temp_positions.shuffle()

func get_next_position():
	if temp_positions.is_empty():
		get_positions()
	current_position = temp_positions.pop_front()
	direction = to_local(current_position.global_position).normalized()
