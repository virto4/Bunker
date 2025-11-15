/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/*
roxo - cura toda a vida
verde - cura toda a fome
veermelho - tira 50 de vida
*/
function embaralhar(vetor) {
	var i = array_length(vetor) - 1
	while i >= 0 {
		var j = irandom_range(0, array_length(vetor) - 1)
		var aux = vetor[i]
		vetor[i] = vetor[j]
		vetor[j] = aux
		i--
	}
	return vetor
}
instancia_clicada = noone
cogumelos = false
cogumelos_posicoes = [
	[240, 270],
	[230, 660],
	[700, 300],
	[1200, 320],
	[990, 700],
	[700, 500]
]
clicou_cogumelo = false
primeiro = false
segundo = false
terceiro = false
quarto = false
tirar = false
scale_cogumelo = 0
destruir = false

gripe = false
gripe_aux = true
escorbuto = false
disenteria = false
leptospirose = false
enxaqueca = false

tirar_mala = false
mala_question = false
mala_interface = false
mala_interface_aux = false
mudar_mala = true
vez_mala = 1
mala_atual = []

mala_posicoes = [
	[700, 600],
	[1100, 800],
	[830, 700],
	[1150, 700]
] //certifique-se que todos os sprites sao 32 x 32
mala_itens = {
	mala1: [[obj_agua, 10, false], [obj_arroz, 2, false], [obj_antibiotico, 1, false]],
	mala2: [[obj_acucar, 2, false], [obj_chumbo, 4, false]],
	mala3: [[obj_pilha, 1, false], [obj_municao, 2, false]],
	mala4: [[obj_curativo, 4, false], [obj_batata, 2, false]],
	mala5: [[obj_cerveja, 1, false]]
}

escureceu = false
mudar = false
clareou = false
objeto_davi_antes = noone

traje_utilizado = noone
davi_coletou = false
tempo_davi = 0
alpha_davi = 0
esperando_davi = false
considerar_loots = true
roger_sai_aux = true
alpha_coleta = 0
roger_sai = false
davi_sai = false
tirar_coleta = false
sair_bunker = false
evento_coleta = false
coleta_aux = false
mudar_coleta = true
vez_coleta = 1
coleta_atual = []
itens_coleta = {
	saida1: [[obj_agua, 10], [obj_repolho, 1], [obj_aspirina, 2]],
	saida2: [[obj_curativo, 5], [obj_municao, 4]],
	saida3: [[obj_escondidinho, 2], [obj_chumbo, 4]],
	saida4: [[obj_pilha, 1], [obj_ovo, 3]],
	saida5: [[obj_cookie, 5], [obj_curativo, 2]]
}

itens_comerciante = []
itens_jogador = []
tirar_final = false
despedida = false
vez_comerciante =  1
mudar_vez = true
trocas = {
	comerciante1: [obj_inseticida, obj_bolo_chocolate, obj_salada, obj_chumbo, obj_alface, obj_chocolate],
	jogador1: [obj_pilha, obj_chocolate, obj_frango, obj_mapa, obj_salada, obj_farinha],
	comerciante2: [obj_radio, obj_chumbo, obj_antibiotico, obj_antibiotico, obj_cookie, obj_farinha],
	jogador2: [obj_tv, obj_escondidinho, obj_curativo, obj_curativo, obj_farinha, obj_chocolate],
	comerciante3: [obj_domino, obj_curativo, obj_chucrute, obj_repolho, obj_escondidinho, obj_ovo_mexido],
	jogador3: [obj_municao, obj_cerveja, obj_agua, obj_alface, obj_batata, obj_ovo],
}
evento_comerciante = false
comerciante_aux = false
interagir_comerciante = false
scale = 0
primeiro = false
segundo = false
sair = false
interagir2 = false
draw_set_font(fnt_dialogos)

largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")

largura_davi = string_width("Davi")
altura_davi = string_height("Davi")
largura_roger = string_width("Roger")
altura_roger = string_height("Roger")
largura_nenhum = string_width("Nenhum")
altura_nenhum = string_height("Nenhum")

sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]
nao2 = [[1610 - largura_nao, 930], [1630, 950 + altura_nao]]

roger = [[290, 930], [310 + largura_roger, 950 + altura_roger]]
davi = [[950 - largura_davi / 2, 930], [970 + largura_davi / 2, 950 + altura_davi]]
nenhum = [[1610 - largura_nenhum, 930], [1630, 950 + altura_nenhum]]
terceiro = false

evento_inimigo = false
derrotou_inimigo = false

evento_ventilacao = false
coisou_ventilacao = false

evento_infiltracao = false
instanciou_infiltracoes = false

evento_canos = false

evento_hoje = 0 //irei trabalhar com todos os eventos no inicio para fins de teste

instanciou_baratas = false
baratas_aux = false
dia_baratas = 0
dia_baratas_aux = false
morreu_inseticida = 0 //conta quantas baratas morreram para o inseticida. devem ser 5 para o evento passar
evento_baratas = false //fala se o evento de baratas está acontecendo

evento_rachaduras = false
instanciou_rachaduras = false

barata = false
capivara = false
delinquentes = false
cardume = false
sequestro = false
saque = false
emma = false
maniaco = false
kkk = false
alcoolatra = false
mib = false
fredie = false

barata_aux = true
capivara_aux = true
delinquentes_aux = true
cardume_aux = true
sequestro_aux = true
saque_aux = true
emma_aux = true
maniaco_aux = true
kkk_aux = true
alcoolatra_aux = true
mib_aux = true
fredie_aux = true

idoso = false
idoso_aux = true
mala = false
mala_aux = true
eletricidade = false
eletricidade_aux = true
termostato = false
termostato_aux = true
familia_feliz = false
familia_feliz_aux = true
radiacao = false
radiacao_aux = true
mofo = false
mofo_aux = true
comerciante = false
crianca = false
crianca_aux = true
canos = true

doenca_gata = false
remedio_gata = false

eventos_inicio = embaralhar([
	"gripe",
	"enxaqueca",
	"baratas",
	"canos",
	"freddie",
	"coleta",
	"coleta",
	"comerciante",
	"mala",
	"mala",
	"capivara",
	"barata"
])

inicio_data = {
	dia2: eventos_inicio[0],
	dia3: eventos_inicio[1],
	dia4: eventos_inicio[2],
	dia6: eventos_inicio[3],
	dia7: eventos_inicio[4],
	dia9: eventos_inicio[5],
	dia10: eventos_inicio[6],
	dia11: eventos_inicio[7],
	dia13: eventos_inicio[8],
	dia14: eventos_inicio[9],
	dia15: eventos_inicio[10],
	dia16: eventos_inicio[11],
}

eventos_meio = embaralhar ([
	"doenca_gata",
	"emma",
	"rachadura",
	"infiltracao",
	"leptospirose",
	"coleta",
	"mala",
	"mala",
	"cardume",
	"saque",
	"comerciante",
	"comerciante"
])
meio_data = {
	dia18: eventos_meio[0],
	dia19: eventos_meio[1],
	dia21: eventos_meio[2],
	dia22: eventos_meio[3],
	dia24: eventos_meio[4],
	dia25: eventos_meio[5],
	dia26: eventos_meio[6],
	dia28: eventos_meio[7],
	dia29: eventos_meio[8],
	dia30: eventos_meio[9],
	dia33: eventos_meio[10],
	dia34: eventos_meio[11],
}

eventos_fim = embaralhar([
	"disenteria",
	"escorbuto",
	"ventilacao",
	"delinquentes",
	"comerciante",
	"comerciante",
	"cogumelos",
	"coleta",
	"coleta",
	"mala",
	"mib",
	"doenca_gata"
])

fim_data = {
	dia36: eventos_fim[0],
	dia37: eventos_fim[1],
	dia38: eventos_fim[2],
	dia39: eventos_fim[3],
	dia40: eventos_fim[4],
	dia41: eventos_fim[5],
	dia43: eventos_fim[6],
	dia44: eventos_fim[7],
	dia45: eventos_fim[8],
	dia46: eventos_fim[9],
	dia48: eventos_fim[10],
	dia49: eventos_fim[11],
}

function evento() {
	switch evento_hoje {
		case "comerciante":
			evento_comerciante = true
			break
		case "baratas": //inseticida
			evento_baratas = true
			break
		case "canos": //tem que trazer agua da casa
			evento_canos = true
			break
		case "rachaduras": //argamassa
			evento_rachaduras =  true
			break
		case "infiltracao": //martelo (quebrar o piso), fita isolante (consertar vazamento), argamassa (fechar buraco)
			evento_infiltracao = true
			break
		case "ventilacao": //chave de fenda (abrir dutos), fita isolante
			evento_ventilacao = true
			break
		case "barata":
			barata = true
			break
		case "capivara":
			capivara = true
			break
		case "delinquentes":
			delinquentes = true
			break
		case "cardume":
			cardume = true
			break
		case "saque":
			saque = true
			break
		case "sequestro":
			sequestro = true
			break
		case "emma":
			emma = true
			break
		case "kkk":
			kkk = true
			break
		case "maniaco":
			maniaco = true
			break
		case "mib":
			mib = true
			break
		case "fredie":
			fredie = true
		case "gripe":
			gripe = true
			break
		case "enxaqueca":
			enxaqueca = true
			break
		case "coleta":
			evento_coleta = true
			break
		case "mala":
			mala = true
			mala_aux = true
			break
		case "leptospirose":
			leptospirose = true
			break
		case "doenca_gata":
			doenca_gata = true
			break
		case "disenteria":
			disenteria = true
			break
		case "escorbuto":
			escorbuto = true
			break
		case "cogumelos":
			cogumelos = true
			break
	}
}