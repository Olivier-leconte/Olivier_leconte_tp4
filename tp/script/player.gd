extends CharacterBody2D
class_name player

var spawn_position: Vector2 = Vector2.ZERO  
@onready var sprite = $AnimatedSprite2D 
@onready var jump_sfx: AudioStreamPlayer = $jump_sfx
@onready var vie = 3
@onready var animation_vie = $vie/bord_de_vie

var invincible: bool = false
var invincible_timer: float = 0.0
const INVINCIBLE_DURATION = 1.5
var est_mort: bool = false

const SPEED = 170.0     
const JUMP_FORCE = 220
const GRAVITY = 400

func _ready():
	spawn_position = global_position
	velocity = Vector2.ZERO
	barre_de_vie()
	est_mort = false
	
func respawn():
	global_position = spawn_position
	velocity = Vector2.ZERO
	invincible = true
	invincible_timer = INVINCIBLE_DURATION
	clignoter()
 
func _physics_process(delta):
	if not is_node_ready():
		return
	
	if invincible:
		invincible_timer -= delta
		if invincible_timer <= 0:
			invincible = false
			modulate = Color(1, 1, 1, 1)
	
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

func take_damage(degat: int):
	if est_mort:
		return
	
	if invincible:
		return
	
	vie = vie - degat
	barre_de_vie()
	
	if vie <= 0:
		est_mort = true
		game_over()
	else:
		respawn()

func game_over():
	set_physics_process(false)
	get_tree().call_deferred("change_scene_to_file", "res://scene/Game_over.tscn")

func clignoter():
	var tween = create_tween()
	tween.set_loops(8)
	tween.tween_property(self, "modulate:a", 0.3, 0.15)
	tween.tween_property(self, "modulate:a", 1.0, 0.15)

func barre_de_vie():
	if vie >= 3:
		animation_vie.play("100%")
	elif vie >= 2:
		animation_vie.play("50%")
	elif vie >= 1:
		animation_vie.play("0%")
