extends AnimatedSprite2D

@onready var pièce_sfx: AudioStreamPlayer = get_node_or_null("pièce_sound.mp3")

func _ready() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		GameManager.coins += 1
		GameManager.score += 100
		
		visible = false
		
		
		if pièce_sfx != null:
			pièce_sfx.play()
			await pièce_sfx.finished
		
		queue_free()
