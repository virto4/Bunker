/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !global.tem_tela_aberta {
	if tem_fala {
		if point_in_rectangle(mouse_x, mouse_y, x - 20, y - 20, x + 20, y + 20) {
			variable_struct_set(obj_cursor.interagir, "meredith", true)
			if mouse_check_button_pressed(mb_left) {
				etapa = true
				tempo_fala = current_time + type_speed
				global.tem_tela_aberta = true
			}
		} else {
			variable_struct_set(obj_cursor.interagir, "meredith", false)
		}
	}
}

if etapa {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale < 5 {
		fala_scale += 0.5
	} else if fala_scale >= 5 {
		etapa = false
		mostrar = true
	}
}
if tem_fala {
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	if mostrar {
		if current_time > tempo_fala {
			if char_index < string_length(msg) {
				char_index++
			}
			tempo_fala = current_time + type_speed
		}
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
		draw_text_ext(210, 760, string_copy(msg, 1, char_index), 30, 1520)
		var largura = string_width("Meredith")
		draw_sprite_ext(spr_dialogo, 0, 170 + largura / 2, 665, (largura + 10) / 320, 1.3, 0, c_white, 1)
		draw_text(170, 640, "Meredith")
		draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_retrato_meredith, 0, 1632, 552, 2, 2, 0, c_white, 1)
		if mouse_check_button_pressed(mb_left) and aux {
			if char_index < string_length(msg) {
				char_index = string_length(msg)
			} else {
				variable_struct_set(obj_cursor.interagir, "meredith", false)
				tem_fala = false
				mostrar = false
				global.tem_tela_aberta = false
				aux = false
				current_text = ""
				char_index = 0
				etapa2 = true
			}
		} else if !aux and mouse_check_button_pressed(mb_left) {
			aux = true
		}
	}
}

if etapa2 {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale > 0 {
		fala_scale -= 0.5
	} else if fala_scale == 0 {
		etapa2 = false
		mostrar = false
	}
}