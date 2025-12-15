class_name MessagePanneau01
extends Area2D

@export var default_message := "A et D pour bouger
<- et -> pour bouger
W et Espace pour sauter
Esc pour faire pause"

func _ready() -> void:
	$message_01.hide()

func show_message(_body):
	$Timer.start()
	$message_01.show()
	$message_01/Fond/Label.text = default_message
	await $Timer.timeout
	$message_01.hide()

func hide_message(_body) -> void:
	$Timer.stop()
	$message_01.hide()
