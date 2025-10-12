/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !global.tem_tela_aberta {
	if interagir {
		if mostrar {
			if current_time > tempo {
				escrever("Miau, Miau.")
				tempo = current_time + type_speed
			}
			draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
			draw_text_ext(200, 760, escrever("Miau, Miau."), 30, 1520)
			var largura = string_width("Meredith")
			draw_sprite_ext(spr_dialogo, 0, 1760 - 10 - largura / 2, 665, (largura + 20) / 320, 1.5, 0, c_white, 1)
			draw_text(1760 - 10 - largura, 640, "Meredith")
			draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
			if mouse_check_button_pressed(mb_left) {
				if char_index < string_length("Miau, Miau.") {
					char_index = string_length("Miau, Miau.")
				} else {
					variable_struct_set(obj_cursor.interagir, "meredith", true)
					interagir = false
					global.tem_tela_aberta = false
					aux = false
					current_text = ""
					char_index = 0
				}
			}
		}
		if point_in_rectangle(mouse_x, mouse_y, x - 20, y - 20, x + 20, y + 20) {
			variable_struct_set(obj_cursor.interagir, "meredith", true)
			if mouse_check_button_pressed(mb_left) and point_distance(obj_personagem.x, obj_personagem.y, x, y) < 100 {
				mostrar = true
				tempo = current_time + type_speed
				global.tem_tela_aberta = true
			}
		} else {
			variable_struct_set(obj_cursor.interagir, "meredith", false)
		}
	}
}