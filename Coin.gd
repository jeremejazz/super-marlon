extends Area2D

export var value:int = 1

var rotation_speed: float = 90.0;

func _ready():
	pass # Replace with function body.
 
func _process(delta):
	rotation_degrees += rotation_speed * delta


func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()
 
