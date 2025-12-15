extends Area2D

func _on_body_entered(body):
	# 1. Vérifiez si l'objet entrant est bien votre classe 'player'
	if body is player:
		# 2. 'Castez' l'objet pour y accéder en tant que Player
		#    (C'est comme dire à Godot : "Fais-moi confiance, c'est un Player !")
		var player_instance: player = body 
		
		# 3. Maintenant, vous pouvez accéder à 'can_die' en toute sécurité
		if player_instance.can_die:
			print("mort")
			player_instance.respawn()
