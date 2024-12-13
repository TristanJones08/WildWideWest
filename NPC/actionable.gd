extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func action() -> void:
	DialogueManager.show_example_dialogue_balloon (dialogue_resource, dialogue_start)


func _on_actionable_body_entered(body: Node2D) -> void:
		DialogueManager.show_example_dialogue_balloon (dialogue_resource, dialogue_start)



func _on_actionable_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
