extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label: Label = get_node('/root/MainScene/Thank you')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Triggermsg_body_entered(body):
	if body.name == "Player":
		label.visible = true;
