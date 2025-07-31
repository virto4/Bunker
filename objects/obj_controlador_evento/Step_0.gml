/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_diario.dia < 30 {
	switch evento_hoje {
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
		case "termostato": //
			break
		case "chuva acida": //nao pode sair do bunker
			break
		case "ventilacao": //chave de fenda (abrir dutos), fita isolante
			evento_ventilacao = true
			break
		case "mofo": // agua sanitaria
			break
		case "radiacao": //contador geiger para indicar o local do vazamento, argamassa para cobrir
			break
	}
} 
if evento_baratas {
	if !instanciou_baratas {
		instance_create_layer(553, 590, "Instances", obj_baratas, {})
		instance_create_layer(680, 560, "Instances", obj_baratas, {})
		instance_create_layer(681, 322, "Instances", obj_baratas, {})
		instance_create_layer(914, 359, "Instances", obj_baratas, {})
		instance_create_layer(1144, 345, "Instances", obj_baratas, {})
		instanciou_baratas = true
		dia_baratas = obj_diario.dia
		obj_personagem.atributos.sanidade -= 10
	}
	if obj_diario.dia != dia_baratas and !dia_baratas_aux  and morreu_inseticida < 5 {
		instanciou_baratas = false
		dia_baratas_aux = true
		evento_baratas = false
	}
}

if evento_rachaduras {
	if !instanciou_rachaduras {
		var posicoes = embaralhar([[518, 524], [1073, 342], [1155, 390], [311, 347]])
		var instanciar = irandom_range(1, array_length(posicoes))
		for (var i = 0; i < instanciar; i++) {
			instance_create_layer(posicoes[i][0], posicoes[i][1], "Instances", obj_rachadura, {})
		}
		instanciou_rachaduras = true
	}
	if !instance_exists(obj_rachadura) {
		evento_rachaduras = false
	}
}

if evento_canos {
	
}

if evento_infiltracao {
	if !instanciou_infiltracoes {
		var posicoes = [[424, 525], [526, 268], [1201, 355]]
		instance_create_layer(posicoes[0][0], posicoes[0][1], "Instances", obj_poca, {})
		instance_create_layer(posicoes[1][0], posicoes[1][1], "Instances", obj_poca, {})
		instance_create_layer(posicoes[2][0], posicoes[2][1], "Instances", obj_poca, {})
		instanciou_infiltracoes = true
	}
	if !instance_exists(obj_poca) {
		evento_infiltracao = false
	}
}