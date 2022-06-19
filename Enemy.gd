extends Area2D

export var speed: int = 100

export var moveDist: int = 100
var ROTATION_SPEED: int = 200
 

var startX: int
var targetX: int

# Called when the node enters the scene tree for the first time.
func _ready():
	 startX= position.x
	 targetX = position.x + moveDist
	

func move_to(current, to, step):
	
	var new = current
	if new < to:
		new += step
		
		if new > to:
			new = to
	else: 
		new -= step
		if new < to:
			new = to
			
	return new
	
func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()

func _process(delta):
	position.x = move_to(position.x, targetX, speed + delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
 
	if targetX == startX: 
		rotation_degrees -= ROTATION_SPEED * delta
 
	else:
 
		rotation_degrees += ROTATION_SPEED * delta
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
