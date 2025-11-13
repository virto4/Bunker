/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if gripe {
	if gripe_aux {
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.gripe)
		gripe_aux = false
	}
	
}

if mala {
	if mala_aux {
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.mala)
		mala_aux = false
	}
	if evento_hoje != "mala" {
		mala = false
	}
	if mudar_mala {
		switch vez_mala {
			case 1:
				mala_atual = mala_itens.mala1
				break
			case 2:
				mala_atual = mala_itens.mala2
				break
			case 3:
				mala_atual = mala_itens.mala3
				break
			case 4:
				mala_atual = mala_itens.mala4
				break
			case 5:
				mala_atual = mala_itens.mala5
				break
		}
		vez_mala++
		mudar_mala = false
	}
}

if evento_coleta {
	if evento_hoje != "coleta" {
		evento_coleta = false
	}
	ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.coleta)
	if mudar_coleta {
		switch vez_coleta {
			case 1:
				coleta_atual = itens_coleta.saida1
				break
			case 2:
				coleta_atual = itens_coleta.saida2
				break
			case 3:
				coleta_atual = itens_coleta.saida3
				break
			case 4:
				coleta_atual = itens_coleta.saida4
				break
			case 5:
				coleta_atual = itens_coleta.saida5
				break
		}
		vez_coleta++
		mudar_coleta = false
	}
}

if evento_comerciante {
	if evento_hoje != "comerciante" {
		evento_comerciante = false
	}
	if !comerciante_aux {
		comerciante_aux = true
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.comerciante)
	}
	if mudar_vez {
		if vez_comerciante == 1 {
			itens_comerciante = trocas.comerciante1
			itens_jogador = trocas.jogador1
		} else if vez_comerciante == 2 {
			itens_comerciante = trocas.comerciante2
			itens_jogador = trocas.jogador2
		} else if vez_comerciante == 3 {
			itens_comerciante = trocas.comerciante3
			itens_jogador = trocas.jogador3
		}
		mudar_vez = false
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
	obj_escada.inimigo.fugir = true
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
	obj_escada.inimigo.fugir = true
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
		instance_create_layer(681, 342, "Instances", obj_baratas, {})
		instance_create_layer(914, 359, "Instances", obj_baratas, {})
		instance_create_layer(1144, 345, "Instances", obj_baratas, {})
		instanciou_baratas = true
		obj_personagem.atributos.sanidade -= 10
		if instance_exists(obj_davi) {
			obj_davi.atributos.sanidade -= 10
		}
	}
	if !baratas_aux {
		ds_list_replace(obj_diario.paginas_escritas, obj_diario.dia + 1, obj_diario.paginas.baratas)
		baratas_aux = true
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