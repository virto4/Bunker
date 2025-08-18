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
		case fredie:
			fredie = true
	}
} 

if barata and barata_aux {
	barata_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 40
	obj_escada.inimigo.nome = "Barata do fim do mundo"
	obj_escada.inimigo.resistencia = 20
	obj_escada.inimigo.total_vida = 10
	obj_escada.inimigo.vida = 10
	obj_escada.inimigo.sagacidade = 35
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if capivara and capivara_aux {
	capivara_aux = false 
	evento_inimigo = true
	obj_escada.inimigo.forca = 20
	obj_escada.inimigo.nome = "Capivara mutante"
	obj_escada.inimigo.resistencia = 90
	obj_escada.inimigo.total_vida = 50
	obj_escada.inimigo.vida = 50
	obj_escada.inimigo.sagacidade = 20
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if delinquentes and delinquentes_aux {
	delinquentes_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 50
	obj_escada.inimigo.nome = "Trupe de delinquentes"
	obj_escada.inimigo.resistencia = 20
	obj_escada.inimigo.total_vida = 300
	obj_escada.inimigo.vida = 300
	obj_escada.inimigo.sagacidade = 40
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if cardume and cardume_aux {
	cardume_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 45
	obj_escada.inimigo.nome = "Cardume infectado"
	obj_escada.inimigo.resistencia = 55
	obj_escada.inimigo.total_vida = 300
	obj_escada.inimigo.vida = 300
	obj_escada.inimigo.sagacidade = 50
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if sequestro and sequestro_aux {
	sequestro_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 45
	obj_escada.inimigo.nome = "Sequestradores"
	obj_escada.inimigo.resistencia = 50
	obj_escada.inimigo.total_vida = 500
	obj_escada.inimigo.vida = 500
	obj_escada.inimigo.sagacidade = 65
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if saque {
	saque = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 70
	obj_escada.inimigo.nome = "Saqueadores"
	obj_escada.inimigo.resistencia = 70
	obj_escada.inimigo.total_vida = 500
	obj_escada.inimigo.vida = 500
	obj_escada.inimigo.sagacidade = 70
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if emma and emma_aux {
	emma_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 80
	obj_escada.inimigo.nome = "Emma"
	obj_escada.inimigo.resistencia = 25
	obj_escada.inimigo.total_vida = 600
	obj_escada.inimigo.vida = 600
	obj_escada.inimigo.sagacidade = 90
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if fredie and fredie_aux {
	fredie_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 85
	obj_escada.inimigo.nome = "Fredie"
	obj_escada.inimigo.resistencia = 60
	obj_escada.inimigo.total_vida = 600
	obj_escada.inimigo.vida = 600
	obj_escada.inimigo.sagacidade = 50
	obj_escada.inimigo.fugir = false
	obj_escada.derrotou = false
}

if maniaco and maniaco_aux {
	maniaco_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 85
	obj_escada.inimigo.nome = "Maníaco"
	obj_escada.inimigo.resistencia = 10
	obj_escada.inimigo.total_vida = 700
	obj_escada.inimigo.vida = 700
	obj_escada.inimigo.sagacidade = 20
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if kkk  and kkk_aux {
	kkk_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 90
	obj_escada.inimigo.nome = "Ku Klux Klan"
	obj_escada.inimigo.resistencia = 70
	obj_escada.inimigo.total_vida = 600
	obj_escada.inimigo.vida = 600
	obj_escada.inimigo.sagacidade = 70
	obj_escada.inimigo.fugir = false
	obj_escada.derrotou = false
}

if alcoolatra and alcoolatra_aux {
	alcoolatra_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 50
	obj_escada.inimigo.nome = "Indíviduo viciado"
	obj_escada.inimigo.resistencia = 50
	obj_escada.inimigo.total_vida = 200
	obj_escada.inimigo.vida = 200
	obj_escada.inimigo.sagacidade = 65
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if mib and mib_aux {
	mib_aux = false
	evento_inimigo = true
	obj_escada.inimigo.forca = 90
	obj_escada.inimigo.nome = "Homens do governo"
	obj_escada.inimigo.resistencia = 90
	obj_escada.inimigo.total_vida = 1000
	obj_escada.inimigo.vida = 1000
	obj_escada.inimigo.sagacidade = 70
	obj_escada.inimigo.fugir = true
	obj_escada.derrotou = false
}

if evento_inimigo {
	if derrotou_inimigo {
		derrotou_inimigo = false
		evento_inimigo = false
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

if evento_ventilacao and !coisou_ventilacao {
	var instancias = irandom_range(0, 2)
	instance_find(obj_ventilacao, instancias).comecar = true
	coisou_ventilacao = true
}