/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

function escrever(_x, _y, _texto, _cores) { //cores é um vetro de struct assim: {pos: 0, cor: c_green}. passar na ordem por posicao
	var x_atual = _x
	for (var i = 0; i < array_length(_cores); i++) {
		var inicio = _cores[i].pos
		var fim = (i < array_length(_cores) - 1) ? _cores[i + 1].pos : string_length(_texto) + 1 //se essa não for a ultima interação, o final é o inicio da proxima cor. se for, o final é o fim do proprio texto
		draw_set_color(_cores[i].cor)
		draw_set_font(fnt_dialogos)
		draw_text(x_atual, _y, string_copy(_texto, inicio, fim - inicio))
		x_atual += string_width(string_copy(_texto, inicio, fim - inicio))
	} 
}

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

if !global.tem_tela_aberta {
	if interagir {
		if point_in_rectangle(mouse_x, mouse_y, x - 28, y - 110, x + 32, y + 86) {
			variable_struct_set(obj_cursor.interagir, "davi", true)
			if mouse_check_button_pressed(mb_left) {
				etapa = true
				global.tem_tela_aberta = true
			}
		} else {
			variable_struct_set(obj_cursor.interagir, "davi", false)
		}
	}
}

if interagir and etapa {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale < 5 {
		fala_scale += 0.5
	} else if fala_scale >= 5 {
		etapa = false
		mostrar = true
	}
}

if interagir and mostrar {
	if pode_conversar {
		obj_conquistas.conversou++
	}
	if !respondeu {
		msg = variable_struct_get(falas[fala_dia][fala_atual], "fala")
	} else {
		msg = variable_struct_get(resposta, "fala")
	}
	if current_time > tempo {
		if char_index < string_length(msg) {
			if (!audio_is_playing(snd_dialogo_escrito)) {
		        audio_play_sound(snd_dialogo_escrito, 1, true)
		    }
			char_index++
		} else {
			audio_stop_sound(snd_dialogo_escrito)
		}
		tempo = current_time + type_speed
	}
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	if array_length(struct_get_names(falas[fala_dia][fala_atual])) > 3 and !respondeu {
		var struct = variable_struct_get(falas[fala_dia][fala_atual], "respostas")
		pode_pular = false
		var largura_opcao = string_width(variable_struct_get(struct, "um"))
		var altura_opcao = string_height(variable_struct_get(struct, "um"))
		if point_in_rectangle(mx, my, 200, 830 - altura_opcao / 2, 220 + largura_opcao, 850 + altura_opcao / 2) {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(200, 830 - altura_opcao / 2, 220 + largura_opcao, 850 + altura_opcao / 2, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(205, 835 - altura_opcao / 2, 215 + largura_opcao, 845 + altura_opcao / 2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				especial = true
				aux = true
				respondeu = true
				resposta = variable_struct_get(falas[fala_dia][fala_atual], "respostas2")
				resposta = variable_struct_get(resposta, "um")
			}
		} else {
			primeiro = false
		}
		draw_text(210, 820, variable_struct_get(struct, "um"))
		
		altura_opcao = string_height(variable_struct_get(struct, "dois"))
		largura_opcao = string_width(variable_struct_get(struct, "dois"))
		var xis = 960 - largura_opcao / 2
		if point_in_rectangle(mx, my, xis - 10, 830 - altura_opcao / 2, xis + 10 + largura_opcao, 850 + altura_opcao / 2) {
			if !primeiro2 {
				primeiro2 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(xis - 10, 830 - altura_opcao / 2, xis + 10 + largura_opcao, 850 + altura_opcao / 2, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(xis - 5, 835 - altura_opcao / 2, xis + 5 + largura_opcao, 845 + altura_opcao / 2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				especial = true
				aux = true
				respondeu = true
				resposta = variable_struct_get(falas[fala_dia][fala_atual], "respostas2")
				resposta = variable_struct_get(resposta, "dois")
			}
		} else {
			primeiro2 = false
		}
		draw_text(xis, 820, variable_struct_get(struct, "dois"))
		
		altura_opcao = string_height(variable_struct_get(struct, "tres"))
		largura_opcao = string_width(variable_struct_get(struct, "tres"))
		xis = 1710 - largura_opcao
		if point_in_rectangle(mx, my, xis - 19, 830 - altura_opcao / 2, xis + 10 + largura_opcao, 850 + altura_opcao / 2) {
			if !primeiro3 {
				primeiro3 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(xis - 10, 830 - altura_opcao / 2, xis + 10 + largura_opcao, 850 + altura_opcao / 2, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(xis - 5, 835 - altura_opcao / 2, xis + 5 + largura_opcao, 845 + altura_opcao / 2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				especial = true
				aux = true
				respondeu = true
				resposta = variable_struct_get(falas[fala_dia][fala_atual], "respostas2")
				resposta = variable_struct_get(resposta, "tres")
			}
		} else {
			primeiro3 = false
		}
		draw_text(xis, 820, variable_struct_get(struct, "tres"))
	} else {
		pode_pular = true
	}
	draw_text_ext(210, 760, string_copy(msg, 1, char_index), 30, 1520)
	var largura = string_width(falas[fala_dia][fala_atual].personagem)
	var altura = 640 - (78 - string_height("A")) / 2
	draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
	var xis = 0
	for (var i = 0; i < largura / 10; i++) {
		draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
		xis += 10
	}
	draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
	//draw_sprite_ext(spr_dialogo, 0, 170 + largura / 2, 665, (largura + 10) / 320, 1.3, 0, c_white, 1)
	draw_text(170, 640, falas[fala_dia][fala_atual].personagem)
	draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
	draw_sprite_ext(variable_struct_get(falas[fala_dia][fala_atual], "retrato"), 0, 1632, 552, 1, 1, 0, c_white, 1)
	if mouse_check_button_pressed(mb_left) and aux {
		if char_index < string_length(msg) {
			char_index = string_length(msg)
			audio_stop_sound(snd_dialogo_escrito);
		} else if fala_atual < array_length(falas[fala_dia]) - 1 {
			fala_atual++
			char_index = 0
		} else if !especial and pode_pular {
			sao = true
			aumento_sanidade = 5
			obj_personagem.sao = true
			obj_personagem.aumento_sanidade = 5
			audio_stop_sound(snd_dialogo_escrito);
			variable_struct_set(obj_cursor.interagir, "davi", false)
			interagir = false
			mostrar = false
			global.tem_tela_aberta = false
			aux = false
			current_text = ""
			char_index = 0
			fala_atual = 0
			respondeu = false
			fala_dia++
			etapa2 = true
		} else if especial {
			especial = false
			char_index = 0
		}
	} else if !aux and mouse_check_button_pressed(mb_left) {
		aux = true
	}
}

if alimento or remedio or beber_agua {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, alimento_scale, alimento_scale, 0, c_white, 1)
	if alimento_scale < 5 {
		alimento_scale += 0.5
	} else if alimento_scale >= 5 {
		var nome = variable_struct_get(global.nomes, object_get_name(obj_personagem.item_selecionado))
		var largura = string_length(nome)
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text(220, 800, "Você deseja dar a Davi " + nome + " ?")
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if mouse_sim {
			if !mouse_aux1 {
				mouse_aux1 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			mouse_aux1 = false
		}
		draw_text(300, 940, "Sim")
		if mouse_nao {
			if !mouse_aux2 {
				mouse_aux2 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			mouse_aux2 = false
		}
		draw_text(1620, 940, "Não")
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

if tirar {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, alimento_scale, alimento_scale, 0, c_white, 1)
	if alimento_scale > 0 {
		alimento_scale -= 0.5
	} else if alimento_scale == 0 {
		tirar = false
	}
}