/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
instanciou_baratas = false

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

evento_hoje = 0 //irei trabalhar com todos os eventos no inicio para fins de teste

eventos_inicio = [
	"baratas",
	"canos",
	"rachaduras",
	"infiltração",
	"termostato",
	"chuva acida",
	"ventilacao",
	"mofo",
	"radiacao",
]

inicio_data = {
	dia1: eventos_inicio[0],
	dia2: eventos_inicio[1],
	dia3: eventos_inicio[2],
	dia4: eventos_inicio[3],
	dia5: eventos_inicio[4],
	dia6: eventos_inicio[5],
	dia7: eventos_inicio[6],
	dia8: eventos_inicio[7],
	dia9: eventos_inicio[8]
}
/*
eventos_meio = embaralhar ([
	"baratas",
	"rachaduras",
	"infiltração",
	"termostato",
	"chuva acida"
])
meio_data = {
	dia31: eventos_meio[0],
	dia32: eventos_meio[1],
	dia33: eventos_meio[2],
	dia36: eventos_meio[3],
	dia38: eventos_meio[4]
}

meio_data = {
	dia70: eventos_fim[0],
	dia72: eventos_fim[1],
	dia74: eventos_fim[2],
	dia76: eventos_fim[3],
	dia78: eventos_fim[4]
}
eventos_fim = embaralhar([
	"baratas",
	"ventilacao",
	"mofo",
	"radiacao",
	"radiacao"
])