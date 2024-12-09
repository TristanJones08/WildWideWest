extends Node

class_name StateMachine

signal transitioned(state_name)

var state_name
@export var initial_state: NodePath
@onready var state_label = $"../StateLabel"
@onready var state = get_node(initial_state)

func _ready():
	for child in (get_children() as Array):
		child.state_machine = self

	state.enter()
	state_label.text = initial_state

func _process(delta):
	if state.has_method("update"):
		state.update(delta)

func _physics_process(delta):
	if state.has_method("physics_update"):
		state.physics_update(delta)

func transition_to(target_state_name: String, msg: Dictionary = {}):
	if not has_node(target_state_name):
		return

	state_name = target_state_name
	if state.has_method("exit"):
		state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	state_label.text = state_name