extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var overworld_music = preload("res://Audio/level1.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = overworld_music
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
