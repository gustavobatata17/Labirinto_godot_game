extends KinematicBody2D

var gravidade = 40
var movimento = 40
var direcao = 1

func _process(delta):
	move_and_slide(Vector2(0,gravidade))
	if direcao == 1:
		move_and_slide(Vector2(movimento,0), Vector2.UP)
		get_node("AnimatedSprite").flip_h = false
	else:
		move_and_slide(Vector2(-movimento,0), Vector2.UP)
		get_node("AnimatedSprite").flip_h = true
	if is_on_wall():
		direcao = direcao * -1		
