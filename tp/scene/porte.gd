extends Area2D



@export var nouvelle_scene: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		call_deferred("_changer_scene")

func _changer_scene():
	get_tree().change_scene_to_packed(nouvelle_scene)

	
