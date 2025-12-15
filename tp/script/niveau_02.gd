extends Node2D

const PIÈCE_SOUND = preload("uid://dfbdwwng7ammr")





func on_door_body_entered(body): 
	if body is player:
		get_tree().change_scene_to_file("res://scenes/niveau_03.tscn")
