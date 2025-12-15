extends CharacterBody2D
class_name player
var took_damage = false


var can_die: bool = true
var spawn_position: Vector2 = Vector2.ZERO  

@onready var sprite = $AnimatedSprite2D 
@onready var jump_sfx: AudioStreamPlayer = $jump_sfx



const SPEED = 120.0     
const JUMP_FORCE = 170
const GRAVITY = 400


var spawn_point_position: Vector2 = Vector2.ZERO 


func _ready():
	spawn_position = global_position
	print("Position de spawn: ", spawn_position)  
	velocity = Vector2.ZERO
	

func respawn():

	var scene_name = get_tree().current_scene.name

	if scene_name == "res://scene/niveau_02.tscn":
		global_position = Vector2(-21.0, -1.0)

	velocity = Vector2.ZERO


 
func _physics_process(delta):
	# Attendre que _ready() soit complètement fini
	if not is_node_ready():
		return
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta



	
	var input_dir = Input.get_axis("gauche", "droite")
	velocity.x = input_dir * SPEED
	
	if input_dir != 0:
		sprite.flip_h = (input_dir == -1)
	
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_FORCE
		jump_sfx.play()
		


	animation(input_dir)




	move_and_slide()


func animation(direction):
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("walk")
	else:

		sprite.play("idle")  
	


func _on_porte_body_entered(_body: Node2D) -> void:
	print('Player dans la porte, changement de scène...')

	get_tree().call_deferred("change_scene_to_file", "res://scene/niveau_02.tscn")
	pass
	
