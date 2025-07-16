/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
persistent = true

window_set_fullscreen(true)
cliques_dividir_tela = 0

n_alpha = 1

x_nuvem1 = 200
y_nuvem1 = 200

x_nuvem2 = 1900
y_nuvem2 = 800

x_nuvem3 = 1500
y_nuvem3 = 500

x_nuvem4 = 900
y_nuvem4 = 700

x_logo = 1920 / 2
y_logo = 1080 / 2 - 100

x2 = 350
y2 = 150
width = 512
height = 256

l_dividir = 36
x_dividir = 1840
y_dividir = 80

x_jogar = 1920 / 2
y_jogar = 1080 - y2
mudar_jogo = false
tempo = 0
a_jogar = 1

a_conquistas = 1
x_conquistas = x2
y_conquistas = 1080 - y2
mudar_conquistas = false
sair_conquistas = false
alpha_conquistas = 1

a_sair = 1
x_sair = 1920 - x2
y_sair = 1080 - y2
sair_jogo = false
alpha = 0

a_voltar = 1
x_voltar = x2
y_voltar = y2

posicoes_estrelas = {
	estrela1		: spr_estrela1,
	estrela1_x		: 300,
	estrela1_y		: 450,
	estrela2		: spr_estrela2,
	estrela2_x		: 550,
	estrela2_y		: 200
}

em_transicao = false

tempo = 0