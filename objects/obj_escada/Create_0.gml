/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false
nome_inimigo = "inimigo"
cor_atacar = #990A0E
cor_correr = #B2760B
cor_circulo1 = #2E7F0E
cor_circulo2 = #2E7F0E
selecionar_arma_roger = false
selecionar_arma_davi = false
selecionar_hab_roger = false
selecionar_hab_davi = false
arma_roger = noone
arma_davi = noone
arma_x_davi = 1
arma_x_roger = 1
cor_hab  = #43717F
cor_hab_1 = #43717F
hab_roger = false
hab_davi = false
cor_unidade = #43717F
habilidade_roger = ""
habilidade_davi = ""
mensagem = false
codigo = ""
tempo = 0
tempo_turno = 0
batalha = false
sua_vez = 0
executar = false
ataque_inimigo = false
_y = 0
alpha = 0
golpe_duplo = false
mensagem_turno = true
aux = false
tempo_aux = 0
derrotou = false
cor_circulo = #2E7F0E

golpe_morte_tempo1 = false
golpe_morte_numero1 = 1
mestre_tempo1 = false
mestre_numero1 = 1

golpe_morte_tempo2 = false
golpe_morte_numero2 = 1
mestre_tempo2 = false
mestre_numero2 = 1
contagem = false

critico2 = false
errou2 = false
receptor = noone


obj = noone
dano = 0

x_inimigo = 960
y_inimigo = 540
largura_inimigo = 246

x_roger = 172
y_roger = 894
largura_roger = 246

x_davi = 1742
y_davi = 894 
largura_davi = 246

inimigo = {
	nome: "inimigo",
	total_vida: 200,
	vida: 200,
	forca: 40,
	resistencia: 30,
	sagacidade: 80,
	fugir: true
}

armas = {
	"obj_metralhadora": 90,
	"obj_pistola": 80,
	"obj_machado": 75,
	"obj_picareta": 70,
	"obj_frigideira": 40,
	"obj_panela_pressao": 35
}