extends CanvasLayer


const LEVEL_01 = preload("res://scene/level_01.tscn")




func _on_commencer_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_01)


func _on_quitter_pressed() -> void:
	get_tree().quit()
