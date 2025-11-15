/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if point_in_rectangle(x, y, obj_personagem.x - 40, obj_personagem.y, obj_personagem.x + 40, obj_personagem.y + 90) and y < 320 {
	depth = obj_personagem.depth + 1
}
if instance_exists(obj_davi) and obj_personagem.ativada {
	if point_in_rectangle(x, y, obj_davi.x - 40, obj_davi.y, obj_davi.x + 40, obj_davi.y + 90) and y < 320 {
		depth = obj_davi.depth + 1
	}
}

if instance_exists(obj_diario) {
	if obj_diario.dia == 33 and !pilha_aux1 {
		pilhas = true
		pilha_aux1 = true
	} else if obj_diario.dia == 66 and !pilha_aux2 {
		pilhas = true
		pilha_aux2 = true
	}
}

if entrou and instance_exists(obj_calendario) and clicou {
    // Reinicia variáveis de controle
    dia_semana1 = -1;
    dia_atual++
	if mes_atual == 7 or mes_atual == 8 or mes_atual == 10 or mes_atual == 12 {
		if dia_atual > 31 {
			dia_atual = 1
			mes_atual++
		}
	}
	if mes_atual == 9 or mes_atual == 11 {
		if dia_atual > 30 {
			dia_atual = 1
			mes_atual++
		}
	}
    // Calcula dia base do mês
    switch (mes_atual) {
        case 7: dia_semana = 1; break; // domingo
        case 8: dia_semana = 4; break; // quarta
        case 9: dia_semana = 7; break; // sábado
        case 10: dia_semana = 2; break; // segunda
        case 11: dia_semana = 5; break; // quinta
        case 12: dia_semana = 7; break; // sábado
        default: dia_semana = 1; break; // padrão domingo
    }
	dia_semana1  = ((dia_semana + dia_atual - 2) mod 7);
    // Define programação baseada no dia da semana
    if (dia_semana1 == 1) { // Domingo
        programacao = jesus[jesus_id];
		jesus_id++
		programa = "Rádio Jesus"
		if instance_exists(obj_conquistas) and !assistiu_jesus {
			assistiu_jesus = true
			obj_conquistas.programas_assistidos++
		}
    }
    else if (dia_semana1 == 2) { // Segunda
		if instance_exists(obj_conquistas) and !assistiu_sob {
			assistiu_sob = true
			obj_conquistas.programas_assistidos++
		}
        programacao = sobrevivencia[sobrevivencia_id];
		programa = "Guia de Sobrevivência Pós-Apocalíptica"
		switch sobrevivencia_id {
			case 1:
				array_push(obj_personagem.habilidades_adquiridas, obj_personagem.habilidades[0])
				break
			case 2:
				array_push(obj_personagem.habilidades_adquiridas, obj_personagem.habilidades[1])
				break
			case 8:
				array_push(obj_personagem.habilidades_adquiridas, obj_personagem.habilidades[7])
				break
			case 7:
				array_push(obj_personagem.habilidades_adquiridas, obj_personagem.habilidades[2])
				break
			case 12:
				array_push(obj_personagem.habilidades_adquiridas, obj_personagem.habilidades[7])
				break
		}
		sobrevivencia_id++
    }
    else if (dia_semana1 == 8) { // Quarta
		if instance_exists(obj_conquistas) and !assistiu_comida {
			assistiu_comida = true
			obj_conquistas.programas_assistidos++
		}
        programacao = cozinha[cozinha_id];
		programa = "Cozinha Improvisada"
		if cozinha_id % 8 == 0 {
			ovo_mexido = true
		} else {
			ovo_mexido = false
		}
		if cozinha_id % 8 == 1 {
			salada = true
		} else {
			salada = false
		}
		if cozinha_id % 8 == 2 {
			bolo_chocolate = true
		} else {
			bolo_chocolate = false
		}
		if cozinha_id % 8 == 3 {
			bolo_quatro_quartos = true
		} else {
			bolo_quatro_quartos = false
		}
		if cozinha_id % 8 == 4 {
			chucrute = true
		} else {
			chucrute = false
		}
		if cozinha_id % 8 == 5 {
			cookie = true
		} else {
			cookie = false
		}
		if cozinha_id % 8 == 6 {
			escondidinho = true
		} else {
			escondidinho = false
		}
		if cozinha_id % 8 == 7 {
			arroz_frango = true
		} else {
			arroz_frango = false
		}
		cozinha_id++
    }
    else if (dia_semana1 == 5) { // Quinta
		if instance_exists(obj_conquistas) and !assistiu_noticias {
			assistiu_noticias = true
			obj_conquistas.programas_assistidos++
		}
        programacao = noticias[noticias_id];
		noticias_id++
		programa = "Notícias Urgentes"
    } else {
		programacao = sem_programa
	}
	entrou = false
}
if clicou and !pilhas {
	global.tem_tela_aberta = true
	tempo = current_time + type_speed
	j = 0
	
	if mouse_check_button_pressed(mb_left) {
		if !clicou_radio { //ele clicava no radio 
			clicou_radio = true
		} else {
			if ovo_mexido {
				ds_list_add(obj_cozinha_bunker.receitas, obj_ovo_mexido )
			}
			if bolo_chocolate {
				ds_list_add(obj_cozinha_bunker.receitas, obj_bolo_chocolate )
			}
			if bolo_quatro_quartos {
				ds_list_add(obj_cozinha_bunker.receitas, obj_bolo_quatro_quartos )
			}
			if salada {
				ds_list_add(obj_cozinha_bunker.receitas, obj_salada )
			}
			if cookie {
				ds_list_add(obj_cozinha_bunker.receitas, obj_cookie )
			}
			if escondidinho {
				ds_list_add(obj_cozinha_bunker.receitas, obj_escondidinho )
			}
			if arroz_frango {
				ds_list_add(obj_cozinha_bunker.receitas, obj_arroz_frango )
			}
			if chucrute {
				ds_list_add(obj_cozinha_bunker.receitas, obj_chucrute )
			}
			if char_index < string_length(programacao[indice_atual]) {
				current_text = programacao[indice_atual]
				char_index = string_length(programacao[indice_atual])
			} else {
				if indice_atual == array_length(programacao) - 1 {
					clicou = false
					char_index = 0
					clicou_radio = false
					indice_atual = 0
					global.tem_tela_aberta = false
					etapa2 = true
					if !assistiu_hoje {
						assistiu_hoje = true
						if instance_exists(obj_davi) {
							obj_davi.sao = true
							obj_davi.aumento_sanidade = 5
						}
						obj_personagem.sao = true
						obj_personagem.aumento_sanidade = 5
					}
				} else {
					char_index = 0
					indice_atual++
				}
			}
		}
	}
}