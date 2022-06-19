extends KinematicBody2D




# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score: int = 0
var speed: int = 200
var jumpforce: int = 600
var gravity: int = 900

var vel: Vector2 = Vector2()

onready var sprite: AnimatedSprite = get_node("AnimatedPlayerSprite")
onready var ui:Node = get_node('/root/MainScene/CanvasLayer/UI')
onready var audioPlayer:Node = get_node('/root/MainScene/Camera2D/AudioPlayer')
onready var audioPlayer2:Node = get_node('/root/MainScene/Camera2D/AudioPlayer2')
# onready var label: Label = get_node("/root/MainScene/Camera2D/UI/Label")

func _physics_process(delta):
	vel.x = 0
	
	# movement. 
	if Input.is_action_pressed("move_left"): 
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed

 
	
	vel = move_and_slide(vel, Vector2.UP )
	# print("x:", vel.x, "y:", vel.y)
	# gravity 
	vel.y += gravity * delta
	
	# jump 
	if is_on_floor():
		if (Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left")):
			sprite.play("run")	
		else:
			sprite.play("idle")
		if Input.is_action_just_pressed("jump"):
			audioPlayer2.play_jump()
			vel.y -= jumpforce
	else:
		sprite.play("jump")
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
	
	if position.y > 900.0:
		die()
	
		
func die():
	
	print("Game Over")
 
	
	audioPlayer.play_death_sfx()
	get_tree().paused = true

	yield(get_tree().create_timer(3.0), "timeout")
	print("Restarting")
	get_tree().reload_current_scene()
	get_tree().paused = false
 

func collect_coin(value):

	score += value
	ui.set_score_text(score)
	audioPlayer.play_coin_sfx();
 
	 
	
 


 
