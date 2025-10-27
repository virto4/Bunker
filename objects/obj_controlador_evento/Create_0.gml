/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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

evento_inimigo = false
derrotou_inimigo = false

evento_ventilacao = false
coisou_ventilacao = false

evento_infiltracao = false
instanciou_infiltracoes = false

evento_canos = false

evento_hoje = 0 //irei trabalhar com todos os eventos no inicio para fins de teste

instanciou_baratas = false
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

gripe = false
enxaqueca = false
desidratacao = false
leptospirose = false
doenca_gata = false
disenteria = false
escorbuto = false
depressao = false
cogumelos = false

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

gripe_aux = true
enxaqueca_aux = true
desidratacao_aux = true
leptospirose_aux = true
doenca_gata_aux = true
disenteria_aux = true
escorbuto_aux = true
depressao_aux = true
cogumelos_aux = true

idoso = false
idoso_aux = true
coleta = false
coleta_aux = true
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
comerciante_aux = true
crianca = false
crianca_aux = true
canos = true

eventos_inicio = [
	"capivara",
	"gripe",
	"enxaqueca",
	"baratas",
	"canos",
	"idoso",
	"coleta",
	"desidratacao",
	"mala",
	"capivara",
	"barata", //ok
	"leptospirose", //é só meter um diálogo e fazer o personagem ter que trazer agua de casa
	"freddie",//ok
]

inicio_data = {
	dia1: "capivara", //adicionar aqui o evento que está testando
	dia3: eventos_inicio[0],
	dia6: eventos_inicio[1],
	dia8: eventos_inicio[2],
	dia10: eventos_inicio[3],
	dia13: eventos_inicio[4],
	dia15: eventos_inicio[5],
	dia18: eventos_inicio[6],
	dia21: eventos_inicio[7],
	dia23: eventos_inicio[8],
	dia26: eventos_inicio[9],
	dia28: eventos_inicio[10],
	dia30: eventos_inicio[11],
}

eventos_meio = embaralhar ([
	"doenca_gata",
	"eletricidade",
	"rachadura",
	"infiltracao",
	"chuva acida",
	"termostato",
	"coleta",
	"mala",
	"cardume",
	"saque",
	"emma",
	"comerciante",
	"baratas"
])
meio_data = {
	dia33: eventos_meio[0],
	dia36: eventos_meio[1],
	dia38: eventos_meio[2],
	dia41: eventos_meio[3],
	dia43: eventos_meio[4],
	dia45: eventos_meio[5],
	dia48: eventos_meio[6],
	dia50: eventos_meio[8],
	dia53: eventos_meio[9],
	dia56: eventos_meio[10],
	dia58: eventos_meio[11],
	dia62: eventos_meio[12]
}

eventos_fim = embaralhar([
	"disenteria",
	"escorbuto",
	"ventilacao",
	"familia_feliz",
	"depressao",
	"mofo",
	"coleta",
	"mala",
	"mib",
	"delinquentes",
	"cogumelos",
	"crianca",
	"radiacao"
])

fim_data = {
	dia66: eventos_fim[0],
	dia70: eventos_fim[1],
	dia73: eventos_fim[2],
	dia76: eventos_fim[3],
	dia77: eventos_fim[4],
	dia79: eventos_fim[5],
	dia82: eventos_fim[6],
	dia84: eventos_fim[7],
	dia86: eventos_fim[8],
	dia88: eventos_fim[9],
	dia92: eventos_fim[10],
	dia94: eventos_fim[11],
	dia96: eventos_fim[12],
}
