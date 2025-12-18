extends Node2D

const PIÈCE_SOUND = preload("res://pièce_sound.mp3")





func on_door_body_entered(body): 
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/niveau_03.tscn")
