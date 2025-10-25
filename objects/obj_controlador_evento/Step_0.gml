/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
	case "fredie":
		fredie = true
	case "gripe":
		gripe = true
		break
	case "enxaqueca":
		enxaqueca = true
		break
	case "idoso":
		idoso = true
		break
	case "coleta":
		coleta = true
		break
	case "desidratacao":
		desidratacao = true
		break
	case "mala":
		mala = true
		break
	case "leptospirose":
		leptospirose = true
		break
	case "doenca_gata":
		doenca_gata = true
		break
	case "eletricidade":
		eletricidade = true
		break
	case "disenteria":
		disenteria = true
		break
	case "escorbuto":
		escorbuto = true
		break
	case "familia_feliz":
		familia_feliz = true
		break
	case "depressao":
		depressao = true
		break
	case "cogumelos":
		cogumelos = true
		break
}

if evento_canos and canos {
	canos = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.canos)
}

if crianca and crianca_aux {
	crianca_aux = false
}

if cogumelos and cogumelos_aux {
	cogumelos_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.cogumelos)
}

if depressao and depressao_aux {
	depressao_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.depressao)
}

if comerciante and comerciante_aux {
	comerciante_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.comerciante)
}

if familia_feliz and familia_feliz_aux {
	familia_feliz_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.familia_feliz)
}

if escorbuto and escorbuto_aux {
	escorbuto_aux = false 
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.escorbuto)
}

if disenteria and disenteria_aux {
	disenteria_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.disenteria)
}

if termostato and termostato_aux {
	termostato_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.termostato)
}

if eletricidade and eletricidade_aux {
	eletricidade_aux = false 
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.eletricidade)
}

if doenca_gata and doenca_gata_aux {
	doenca_gata_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.doenca_gata)
}

if leptospirose and leptospirose_aux {
	leptospirose_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.leptospirose)
}

if mala and mala_aux {
	mala_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.mala)
}

if coleta and coleta_aux {
	coleta_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.coleta)
}

if desidratacao and desidratacao_aux {
	desidratacao_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.desidratacao)
}

if idoso and idoso_aux {
	idoso_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.idoso)
}

if enxaqueca and enxaqueca_aux {
	enxaqueca_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.enxaqueca)
}

if gripe and gripe_aux {
	gripe_aux = false
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.gripe)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.barata)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.capivara)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.delinquentes)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.cardume)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.capivara)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.saque)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.emma)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.freddie)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.capivara)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.capivara)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.capivara)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.mib)
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
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.baratas)
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
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.rachaduras)
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
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.infiltracao)
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
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.ventilacao)
}