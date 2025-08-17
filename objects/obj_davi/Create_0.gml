/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
humores = ["NEUTRO", "EXTASIADO", "COLÉRICO", "DEPRIMIDO", "APAVORADO"]

atributos = {
	saude: 100,
	fome: 100,
	sede: 100,
	sanidade: 100,
	humor: humores[0],
	sagacidade: 50,
	forca: 25,
	resistencia: 35,
	fortuna: 45,
}

mudou_humor = false

alimento = false
alimento_scale = 0
alpha_sim = 0
alpha_nao = 0
mouse_sim = false
mouse_nao = false
draw_set_font(fnt_dialogos)
largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")
sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]
alimentou = false
y_alimentou = y - sprite_height / 2 + 20
aumento_fome = 0

remedio = false
tomou_remedio = false
aumento_saude = 0

comecou_dia = false
dia_bunker = 0
terminou = 0
frames = 0
ipsilon = 0
tempo = 0