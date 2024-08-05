extends KinematicBody2D

# Referência ao CanvasLayer ou Control que exibe a mensagem
var fim_de_jogo_layer : CanvasLayer

func _ready():
	# Encontre o CanvasLayer que contém a mensagem de fim de jogo
	fim_de_jogo_layer = get_tree().root.get_node("Mundo/CanvasLayer")
	if not fim_de_jogo_layer:
		push_error("Não foi possível encontrar o FimDeJogoLayer")

func _on_body_entered(body):
	# Verifica se o jogador entrou na área da princesa
	if body.is_in_group("player"):
		_mostrar_mensagem_fim_de_jogo()

func _mostrar_mensagem_fim_de_jogo():
	if fim_de_jogo_layer:
		var label = fim_de_jogo_layer.get_node("Label")
		label.visible = true
		# Opcional: Pausar o jogo ou executar outras ações
		  # Pausa o jogo


