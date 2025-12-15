extends CanvasLayer





func _process(_delta: float) -> void:
	$compteur.text = str(GameManager.coins)
	$points.text = str(GameManager.score)
