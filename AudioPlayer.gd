extends AudioStreamPlayer2D


var coinSFX = preload("res://Audio/coin.tres")
var deathSFX = preload("res://Audio/death.tres")
var jump_sfx = preload("res://Audio/jump.tres")
func play_coin_sfx():
	stream = coinSFX
	play()
	
func play_death_sfx():
	stream = deathSFX
	play();
	
func play_jump():
	stream = jump_sfx
	play();

