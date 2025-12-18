extends Node


@onready var vies_label = $ViesLabel

func _ready():
	update_vies(3)

func update_vies(vies_count: int):
	vies_label.text = "Vies: " + str(vies_count)
