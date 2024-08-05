extends KinematicBody2D

# Variáveis de configuração
var indice = 0
var gravidade = 800  # Gravidade aplicada
var velocidade_max = 100  # Velocidade máxima de movimento
var forca_pulo = -300  # Força do pulo
var velocidade = Vector2.ZERO  # Velocidade atual do personagem
var no_chao = false  # Flag para verificar se o personagem está no chão
var vida = 3  # Vida inicial do jogador

func _ready():
	pass

func _physics_process(delta):
	# Aplicar gravidade
	if not is_on_floor():
		velocidade.y += gravidade * delta
		no_chao = false
	else:
		no_chao = true
	
	# Verificar entrada de pulo
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocidade.y = forca_pulo
	
	
	# Movimento horizontal
	var movimento_horizontal = 0
	if Input.is_action_pressed("ui_right"):
		movimento_horizontal = velocidade_max
		get_node("Sprite").flip_h = false
	elif Input.is_action_pressed("ui_left"):
		movimento_horizontal = -velocidade_max
		get_node("Sprite").flip_h = true
	
	velocidade.x = movimento_horizontal

	# Aplicar o movimento e a gravidade
	velocidade = move_and_slide(velocidade, Vector2.UP)
	
	# Verificar colisões
	for indice in range(get_slide_count()):
		var colisao = get_slide_collision(indice)
		if colisao.collider.is_in_group("inimigos"):
			_morrer()
			break  # Não precisa verificar mais colisões após a morte

func _morrer():
	vida -= 1
	if vida <= 0:
		_executar_morte()
	else:
		_redefinir_posicao()

func _executar_morte():
	# Lógica de morte, como reiniciar o nível ou mostrar uma tela de game over
	queue_free()  # Remove o jogador da cena, como exemplo

func _redefinir_posicao():
	# Reseta a posição do jogador para um ponto de início, por exemplo
	global_position = Vector2(100, 80)  # Defina a posição inicial conforme necessário

