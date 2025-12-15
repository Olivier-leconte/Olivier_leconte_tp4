extends Area2D

@export var PortailDestination: Marker2D
var cooldown := false

func _on_body_entered(body: Node2D) -> void:
	if cooldown:
		return
	if body is player and PortailDestination:
		cooldown = true
		body.velocity = Vector2.ZERO
		body.global_position = PortailDestination.global_position
		await get_tree().create_timer(0.2).timeout
		cooldown = false
		await get_tree().create_timer(0.3).timeout
		cooldown = false
