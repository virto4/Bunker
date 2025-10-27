/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if room == rm_bunker {
	switch obj_calendario.mes_atual {
		case 7:	
			mes = "Julho"
			break
		case 8:
			mes = "Agosto"
			break
		case 9:	
			mes = "Setembro"
			break
		case 10:
			mes = "Outubro"
			break
		case 11:
			mes = "Novembro"
			break
		case 12:
			mes = "Dezembro"
			break
	}
}

if clicou and !derrotou {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, 960 - 128, 863, 960 + 128, 943) and !morte_roger and !morte_davi and !batalha {
		cor_atacar = #99093D
	} else {
		cor_atacar = #990A0E
	}
	
	if point_in_rectangle(mx, my, 960 - 128, 963, 960 + 128, 1043) and !morte_roger and !morte_davi and !batalha {
		cor_correr = #B25A0B
		if mouse_check_button_pressed(mb_left) {
			if !inimigo.fugir {
				mensagem = true
				codigo = "Não há para onde correr"
			} else {
				audio_stop_sound(musicas[musica])
				derrotou = true
				global.tem_tela_aberta = false
				clicou = false
			}
		}
	} else {
		cor_correr = #B2760B
	}
	
	var x_roger = 172
	var y_roger = 894
	var humor = obj_personagem.atributos.humor
	var novo_y_roger = y_roger - 128 - 45 - string_height(humor)
	if point_in_rectangle(mx, my, x_roger - 128, novo_y_roger - 160, x_roger + 128, novo_y_roger - 10) and !morte_roger and !morte_davi and !batalha {
		if mouse_check_button_pressed(mb_left) {
			hab_roger = true
			aux = true
			tempo_aux = current_time / 1000 + 0.2
		}
		cor_hab = #335A66
	} else {
		cor_hab = #43717F
	}
	
	if instance_exists(obj_davi) and !morte_roger and !morte_davi and !batalha {
		if point_in_circle(mx, my, 1524, 894, 40) { //davi
			cor_circulo1 = #649910
			if mouse_check_button_pressed(mb_left) {
				selecionar_arma_davi = true
				aux = true
				tempo_aux = current_time / 1000 + 0.2
			}
		} else {
			cor_circulo1 = #2E7F0E
		}
		
		var x_davi = 1742
		var y_davi = 894 
		var humor_davi = obj_davi.atributos.humor
		var novo_y = y_davi - 128 - 50 - string_height(humor_davi)
		
		if point_in_rectangle(mx, my, x_davi - 128, novo_y - 160, x_davi + 128, novo_y - 10) and !morte_roger and !morte_davi and !batalha {
			if mouse_check_button_pressed(mb_left) {
				hab_davi = true
				aux = true
				tempo_aux = current_time / 1000 + 0.2
			}
			cor_hab_1 = #335A66
		} else {
			cor_hab_1 = #43717F
		}
	}
	
	if current_time / 1000 > tempo_aux {
		aux = false
	}
	
	if point_in_circle(mx, my, 390, 894, 40) and !morte_roger and !morte_davi and !batalha { //roger
		cor_circulo2 = #649910
		if mouse_check_button_pressed(mb_left) {
			selecionar_arma_roger = true
			aux = true
			tempo_aux = current_time / 1000 + 0.2
		}
	} else {
		cor_circulo2 = #2E7F0E
	}
	
	var pode_batalhar = true
	
	if point_in_rectangle(mx, my, 960 - 128, 863, 960 + 128, 943) and mouse_check_button_pressed(mb_left) and !batalha and !morte_davi and !morte_roger {
		if habilidade_davi == "Curandeiro mestre" and mestre_tempo2 and instance_exists(obj_davi) {
			mensagem = true
			codigo = "Davi ainda não pode usar esta habilidade"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
			pode_batalhar = false
		} else if habilidade_davi == "Golpe da morte" and golpe_morte_tempo2 and instance_exists(obj_davi) {
			mensagem = true
			codigo = "Davi ainda não pode usar esta habilidade"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
			pode_batalhar = false
		}
		if habilidade_roger == "Curandeiro mestre" and mestre_tempo1 {
			mensagem = true
			codigo = "Roger ainda não pode usar esta habilidade"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
			pode_batalhar = false
		} else if habilidade_roger == "Golpe da morte" and golpe_morte_tempo1 {
			mensagem = true
			codigo = "Roger ainda não pode usar esta habilidade"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
			pode_batalhar = false
		}
		if ((arma_davi == obj_pistola or arma_roger == obj_pistola) and tiros_pistola <= 0)
			or ((arma_davi == obj_metralhadora or arma_roger == obj_metralhadora) and tiros_metra <= 0) {
			mensagem = true
			codigo = "Sua arma não pode ser utilizada"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
			pode_batalhar = false
		}
		if (arma_davi == obj_pistola and tiros_pistola <= 1 and habilidade_davi == "Golpe da morte") or
			(arma_roger == obj_pistola and tiros_pistola <= 1 and habilidade_roger == "Golpe da morte") or 
			(arma_roger == obj_metralhadora and tiros_metra <= 1 and habilidade_roger == "Golpe da morte") or
			(arma_davi == obj_metralhadora and tiros_metra <= 1 and habilidade_davi == "Golpe da morte") {
				mensagem = true
				codigo = "Sua arma não tem balas o suficiente para um ataque duplo"
				tempo = current_time / 1000 + 3 
				mensagem_turno = false
				pode_batalhar = false
			}			
		if habilidade_davi == "Sniper" and arma_davi != obj_metralhadora and arma_davi != obj_pistola or 
		habilidade_roger== "Sniper" and arma_roger != obj_metralhadora and arma_roger != obj_pistola {
			mensagem = true
			codigo = "A habilidade sniper só pode ser usada com armas de fogo"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
		} else if habilidade_davi == "Ferramenteiro" and arma_davi != obj_picareta and arma_davi != obj_machado or 
		habilidade_roger== "Ferramenteiro" and arma_roger != obj_picareta and arma_roger != obj_machado {
			mensagem = true
			codigo = "A habilidade ferramenteiro só pode ser usada com armas de corte"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
		} else if ((habilidade_davi == "" or arma_davi = noone) and instance_exists(obj_davi)) or habilidade_roger == "" or arma_roger == noone {
			mensagem = true
			codigo = "Selecione uma arma e uma habilidade para cada personagem"
			tempo = current_time / 1000 + 3 
			mensagem_turno = false
		} else if !batalha and pode_batalhar {
			batalha = true
			tempo_turno = current_time / 1000 + 3
			executar = true
			sua_vez = 0
		}
	}
}