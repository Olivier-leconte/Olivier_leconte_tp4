extends Node
@onready var panel_pause: Panel = %Panel_pause


func _process(_delta):
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed == true):
		get_tree().paused = true
		panel_pause.show()


func _on_continuer_pressed() -> void:
		panel_pause.hide()
		get_tree().paused = false

func _on_quitter_pressed() -> void:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scene/niveau_title_map.tscn")
