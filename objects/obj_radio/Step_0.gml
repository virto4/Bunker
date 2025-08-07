/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if clicou {
	tempo = current_time + type_speed
	j = 0
	
	if obj_calendario.dia_semana == 1 {
		//jesus
		array_push(programacao, jesus[0])
	} else if obj_calendario.dia_semana == 2 {
		//sobrevivencia
	} else if obj_calendario.dia_semana == 4 {
		//cozinha
	} else if obj_calendario.dia_semana == 6 {
		//resenha
	} else if obj_calendario.dia_semana == 5 {
		//noticias
	}
	
	if mouse_check_button_pressed(mb_left) {
		if !clicou_radio { //ele clicava no radio 
			clicou_radio = true
		} else {
			if char_index < string_length(mensagens[indice_atual]) {
				current_text = mensagens[indice_atual]
				char_index = string_length(mensagens[indice_atual])
			} else {
				if indice_atual == array_length(mensagens) - 1 {
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