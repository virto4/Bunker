/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
		texto_atual = mensagens[indice_atual]
		if current_time > tempo {
			escrever(mensagens[indice_atual])
			tempo = current_time + type_speed
		}
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var linhas = quebrar_texto(current_text, 1520)
		for (var i = 0; i < array_length(linhas); i++) {
			draw_text(200, 760 + i * string_height("A") + 5, linhas[i])
		}
	}