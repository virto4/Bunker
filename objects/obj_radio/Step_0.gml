/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if entrou and instance_exists(obj_calendario) {
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
    }
    else if (dia_semana1 == 2) { // Segunda
        programacao = sobrevivencia[sobrevivencia_id];
		sobrevivencia_id++
		programa = "Guia de Sobrevivência Pós-Apocalíptica"
    }
    else if (dia_semana1 == 4) { // Quarta
        programacao = cozinha[cozinha_id];
		cozinha_id++
		programa = "Cozinha Improvisada"
    }
    else if (dia_semana1 == 5) { // Quinta
        programacao = noticias[noticias_id];
		noticias_id++
		programa = "Notícias Urgentes"
    }
    else if (dia_semana1 == 6) { // Sexta
        programacao = resenha[resenha_id];
		resenha_id++
		programa = "Semanário do Sobrevivente"
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