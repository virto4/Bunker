/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	if programacao == noone {
		clicou = false
	} else {
		if current_time > tempo {
			escrever(programacao[indice_atual])
			tempo = current_time + type_speed
		}
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if programacao != sem_programa {
			var largura = string_width(programa)
			draw_sprite_ext(spr_dialogo, 0, 1760 - 10 - largura / 2, 665, (largura + 20) / 320, 1.5, 0, c_white, 1)
			draw_text(1760 - 10 - largura, 640, programa)
		}
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
		var linhas = quebrar_texto(current_text, 1520)
		for (var i = 0; i < array_length(linhas); i++) {
			draw_text(200, 760 + i * string_height("A") + 5, linhas[i])
		}
	}
}