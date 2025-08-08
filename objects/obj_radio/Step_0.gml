/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if entrou and instance_exists(obj_calendario) {
	switch obj_calendario.mes_atual {
		//d - 1; s - 2; t - 3; q - 4; q - 5; s - 6; s - 7
		case 7:
			dia_semana = 1 //domingo
			break
		case 8:
			dia_semana = 4 //quarta
			break
		case 9:
			dia_semana = 7 //sabado
			break
		case 10:
			dia_semana = 2 //segunda
			break
		case 11:
			dia_semana = 5
			break
		case 12:
			dia_semana = 7
			break
	}
	for (var i = 1; i <= 31; i++) {
		if i == 31 and obj_calendario.mes_atual == 9 or obj_calendario.mes_atual == 11 {
			break
		}
		if obj_calendario.dia_atual == i {
			dia_semana1 = dia_semana
			break
		}
		
		dia_semana++
		if dia_semana > 7 {
			dia_semana = 1
		}
	}
	if dia_semana1 == 1 {
		//jesus
		programacao = jesus[jesus_id]
		jesus_id++
	} else if dia_semana1 == 2 {
		//sobrevivencia
		programacao = sobrevivencia[sobrevivencia_id]
		sobrevivencia_id++
	} else if dia_semana1 == 4 {
		//cozinha
		programacao = cozinha[cozinha_id]
		cozinha_id++
	} else if dia_semana1 == 6 {
		//resenha
		programacao = resenha[resenha_id]
		resenha_id++
	} else if dia_semana1 == 5 {
		//noticias
		programacao = noticias[noticias_id]
		noticias_id++
	}
	entrou = false
}
if clicou {
	tempo = current_time + type_speed
	j = 0
	
	if mouse_check_button_pressed(mb_left) {
		if !clicou_radio { //ele clicava no radio 
			clicou_radio = true
		} else {
			if char_index < string_length(programacao[indice_atual]) {
				current_text = programacao[indice_atual]
				char_index = string_length(programacao[indice_atual])
			} else {
				if indice_atual == array_length(programacao) - 1 {
					clicou = false
					char_index = 0
					clicou_radio = false
					indice_atual = 0
				} else {
					char_index = 0
					indice_atual++
				}
			}
		}
	}
}