/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function quebrar_texto(texto, largura_maxima) {
    var linhas = []
    var palavras = string_split(texto, " ")
    var linha_atual = ""
    var i

    for (i = 0; i < array_length(palavras); i++) {
        var palavra = palavras[i]
        var linha_teste = linha_atual + palavra + " "

        if (string_width(linha_teste) > largura_maxima) {
            array_push(linhas, string_trim(linha_atual))
            linha_atual = palavra + " "
        } else {
            linha_atual = linha_teste
        }
    }

    if (linha_atual != "") {
        array_push(linhas, string_trim(linha_atual))
    }

    return linhas;
}

if clicou and image_index == image_number - 1{
	pagina_esquerda = quebrar_texto(ds_list_find_value(paginas_escritas, 2 * pagina), 1170) 
	pagina_direita = quebrar_texto(ds_list_find_value(paginas_escritas, 2 * pagina + 1), 1170) 
	
	draw_set_color(c_black)
	draw_set_font(fnt_dialogos)
	
	var _largura_x = 85
	draw_sprite(spr_interface_diario, 0, 1920 / 2, 1080 / 2)
	draw_sprite(spr_voltar, 0, 1800, 50)
	draw_text(380, 540 - 350 - 50, ds_list_find_value(paginas_datas, 2 * pagina))
	draw_text(980, 540 - 350 - 50, ds_list_find_value(paginas_datas, 2 * pagina + 1))
	for (var _i = 0; _i < array_length(pagina_esquerda); _i++) {
	    draw_text(380, 1080 / 2 - 350 + _i * string_height("A"), pagina_esquerda[_i]);
	}
	for (var _i = 0; _i < array_length(pagina_direita); _i++) {
	    draw_text(980, 1080 / 2 - 350 + _i * string_height("A"), pagina_direita[_i]);
	}
	draw_set_font(fnt_alagard)
	draw_sprite(spr_voltar_diario, 0, 200, 1080 - 50)
	draw_sprite(spr_avancar_diario, 0, 1920 - 200, 1080 - 50)
	draw_sprite(spr_primeira_diario, 0, 1920 / 2 - 300, 1080 - 50)
	if display_mouse_get_x() * 1920 / 1366 > 1800 - _largura_x / 2 and display_mouse_get_x() * 1920 / 1366 < 1800 + _largura_x / 2 and display_mouse_get_y() * 1080 / 768 > 120 - _largura_x / 2 and display_mouse_get_y() *  1080 / 768 < 120 + _largura_x / 2 {
		if mouse_check_button_pressed(mb_left) {
			clicou = false	
			global.tem_tela_aberta = false
		}
	}

	var x1 = (1920 - 1700) + sprite_get_width(spr_pagina_diario) / 2 - string_width(pagina * 2) / 2
	var x2 = 1550 + sprite_get_width(spr_pagina_diario) / 2 - string_width(pagina * 2 + 1) / 2
	var y1 = 50 - 36 + sprite_get_height(spr_pagina_diario) / 2 - string_height(pagina  * 2) / 2
	var y2 = 50 - 36 + sprite_get_height(spr_pagina_diario) / 2 - string_height(pagina * 2 + 1) / 2
	
	
	if pagina == 0 {
		var _sprite_humor
		switch obj_personagem.atributos.humor {
			case "EXTASIADO":
				_sprite_humor = spr_hiperativo
				break
			case "APAVORADO":
				_sprite_humor = spr_apavorado
				break
			case "COLÉRICO":
				_sprite_humor = spr_furioso
				break
			case "DEPRIMIDO":
				_sprite_humor = spr_deprimido
				break
			case "NEUTRO":
				_sprite_humor = spr_neutro
				break
		}
		
		draw_sprite(spr_sede_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 280)
		draw_sprite(spr_fome_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 200)
		draw_sprite(spr_saude_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 120)
		draw_sprite(spr_sanidade_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 40)
		draw_sprite(spr_sagacidade_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 40)
		draw_sprite(spr_forca_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 120)
		draw_sprite(spr_resistencia_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 200)
		draw_sprite(spr_fortuna_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 280)
		
		draw_sprite_part(spr_sede_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sede / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 280 - 25)
		draw_sprite_part(spr_fome_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.fome / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 200 - 25)
		draw_sprite_part(spr_saude_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.saude / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 120 - 25)
		draw_sprite_part(spr_sanidade_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sanidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 40 - 25)
		draw_sprite_part(spr_sagacidade_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sagacidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 40 - 25)
		draw_sprite_part(spr_forca_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.forca / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 120 - 25)
		draw_sprite_part(spr_resistencia_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.resistencia / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 200 - 25)
		draw_sprite_part(spr_fortuna_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.fortuna / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 280 - 25)
		
		var _a = 1080 / 2 - 280
		var vet = ["Sede", "Fome", "Saúde", "Sanidade", "Sagacidade", "Força", "Resistência", "Fortuna"]
		var vet2 = ["Diminui 25 por dia", "Diminui 7 por dia", "Diminui por doenças ou batalhas","Diminui 9 no primeiro mês, 15 no segundo e 21 no terceiro", "Chance de dar golpes críticos ou errados", "Quantidade base de dano causado", "Quantidade de dano resistência ao dano sofrido", "Define os saques de uma batalha"]
		
		if instance_exists(obj_davi) {
			switch obj_davi.atributos.humor {
				case "EXTASIADO":
					_sprite_humor = spr_hiperativo
					break
				case "APAVORADO":
					_sprite_humor = spr_apavorado
					break
				case "COLÉRICO":
					_sprite_humor = spr_furioso
					break
				case "DEPRIMIDO":
					_sprite_humor = spr_deprimido
					break
				case "NEUTRO":
					_sprite_humor = spr_neutro
					break
			}
		
			draw_sprite_ext(spr_sede_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 280, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_fome_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 200, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_saude_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 120, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_sanidade_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 40, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_sagacidade_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 40, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_forca_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 120, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_resistencia_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 200, -1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_fortuna_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 280, -1, 1, 0, c_white, 1)
		
			draw_sprite_part_ext(spr_sede_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sede / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 280 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_fome_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.fome / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 200 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_saude_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.saude / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 120 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_sanidade_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sanidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 40 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_sagacidade_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sagacidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 40 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_forca_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.forca / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 120 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_resistencia_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.resistencia / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 200 - 25, -1, 1, c_white, 1)
			draw_sprite_part_ext(spr_fortuna_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.fortuna / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 280 - 25, -1, 1, c_white, 1)
			
			draw_set_font(fnt_descricoes)
			for (var i = 0; i < 8; i++) {
				if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1060, _a + 80 * i - 25, 1660, _a + 80 * i + 25) {
					draw_sprite(spr_descricao, 0, device_mouse_x_to_gui(0) + 50, device_mouse_y_to_gui(0) + 50)
					draw_text(device_mouse_x_to_gui(0) + 85, device_mouse_y_to_gui(0) + 80, vet[i])
					for (var j = 0; j < array_length(quebrar_texto(vet2[i], 280)); j++) {
						draw_text(device_mouse_x_to_gui(0) + 85, device_mouse_y_to_gui(0) + 132 + j * string_height("A") + 4, quebrar_texto(vet2[i], 280)[j])
					}
				}
			}
		}
		
		draw_set_font(fnt_descricoes)
		for (var i = 0; i < 8; i++) {
			if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 460, _a + 80 * i - 25, 860, _a + 80 * i + 25) {
				draw_sprite(spr_descricao, 0, device_mouse_x_to_gui(0) + 50, device_mouse_y_to_gui(0) + 50)
				draw_text(device_mouse_x_to_gui(0) + 85, device_mouse_y_to_gui(0) + 80, vet[i])
				for (var j = 0; j < array_length(quebrar_texto(vet2[i], 280)); j++) {
					draw_text(device_mouse_x_to_gui(0) + 85, device_mouse_y_to_gui(0) + 132 + j * string_height("A") + 4, quebrar_texto(vet2[i], 280)[j])
				}
			}
		}
	}
}