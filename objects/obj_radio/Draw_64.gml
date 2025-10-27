/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	if programacao == noone {
		clicou = false
	} else {
		//global.tem_tela_aberta = true
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
		if scale < 5 {
			scale += 0.5
		} else if scale >= 5 {
			if !pilhas {
				if current_time > tempo {
					escrever(programacao[indice_atual])
					tempo = current_time + type_speed
				}
				draw_set_font(fnt_dialogos)
				draw_set_color(c_black)
				if programacao != sem_programa {
					var largura = string_width(programa)
					var altura = 640 - (78 - string_height("A")) / 2
					draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
					var xis = 0
					for (var i = 0; i < largura / 10; i++) {
						draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
						xis += 10
					}
					draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
					draw_text(170, 640, programa)
				}
				var linhas = quebrar_texto(current_text, 1520)
				for (var i = 0; i < array_length(linhas); i++) {
					draw_text(200, 760 + i * string_height("A") + 5, linhas[i])
				}
			} else {
				draw_set_color(c_black)
				draw_set_font(fnt_dialogos)
				draw_text(200, 760, "Seu rádio está sem bateria! Precisa de pilhas para poder usá-lo novamente.")
				if mouse_check_button_pressed(mb_left) {		
					clicou = false
					clicou_radio = false
					global.tem_tela_aberta = false
					etapa2 = true
				}
			}
		}
	} 
}

if etapa2 {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else if scale == 0 {
		etapa2 = false
	}
}
