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
		draw_sprite(spr_doenca, 0, 430, 420)//mesmo da saude
		draw_sprite(spr_sede_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 280)
		draw_sprite(spr_fome_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 200)
		draw_sprite(spr_saude_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 120)//
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
		
		var _a = 540 - 280
		var vet = ["Sede", "Fome", "Saúde", "Sanidade", "Sagacidade", "Força", "Resistência", "Fortuna"]
		var vet2 = ["Diminui 25 por dia", "Diminui 7 por dia", "Diminui por doenças ou batalhas","Diminui 9 no primeiro mês, 15 no segundo e 21 no terceiro", "Chance de dar golpes críticos ou errados", "Quantidade base de dano causado", "Quantidade de dano resistência ao dano sofrido", "Define os saques de uma batalha"]
		
		if instance_exists(obj_davi) {
			draw_sprite(spr_doenca, 0, 1490, 420)//mesmo da saude
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
			
			draw_set_font(fnt_dialogos)
			draw_set_color(c_black)
			var mx = device_mouse_x_to_gui(0)
			var my = device_mouse_y_to_gui(0)
			for (var i = 0; i < 8; i++) {
				var altura =  (array_length(quebrar_texto(vet2[i], 400)) + 1) * string_height("A") * 1.2 + 20
				if point_in_rectangle(mx, my, 1060, _a + 80 * i - 25, 1460, _a + 80 * i + 25) {
					draw_rectangle_color(mx + 70, my + 65, mx + 70 + 420, my + 65 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
					draw_rectangle_color(mx + 75, my + 70, mx + 65 + 420, my + 70 + string_height("A") * 1.2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
					draw_rectangle_color(mx + 75, my + 75 + string_height("A") * 1.2, mx + 65 + 420, my + 60 + altura, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
					draw_text(mx + 85, my + 80, vet[i])
					draw_text_ext(mx + 85, my + 80 + string_height("A") * 1.2, vet2[i], string_height("A") * 1.2, 400)
				}
			}
			var altura = 0 //colocar aqui o numero de linhas
			var largura = string_width("Doenças de Davi")
			var saudavel = true
			for (var i = 0; i < array_length(struct_get_names(obj_davi.doencas)); i++) {
				var doenca = variable_struct_get(obj_davi.doencas, struct_get_names(obj_davi.doencas)[i])
				if doenca[0] {
					saudavel = false
					altura++
					if string_width(doenca[1]) + string_width(struct_get_names(obj_davi.doencas)[i]) > largura {
						largura = string_width(struct_get_names(obj_davi.doencas)[i]) +  string_width(": ") + string_width(doenca[1])
					}
				}
			}
			altura *= 50 
			if altura == 0 {
				altura = 50
			}
			var qtde = 0
			if point_in_rectangle(mx, my, 1490 - 25, 420 - 25, 1490 + 25, 420 + 25) {
				draw_rectangle_color(mx - largura - 20, my + 20, mx - 5, my + 85 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
				draw_rectangle_color(mx - largura - 15, my + 25, mx - 10, my + 75, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
				draw_rectangle_color(mx - largura - 15, my + 80, mx - 10, my + 80 + altura, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
				draw_text(mx - largura - 10, my + 30, "Doenças de Davi")
				if saudavel {
					draw_text(mx - largura - 10, my + 85, "Saudável")
				} else {
					for (var i = 0; i < array_length(struct_get_names(obj_davi.doencas)); i++) {
						var doenca = variable_struct_get(obj_davi.doencas, struct_get_names(obj_davi.doencas)[i])
						if doenca[0] {
							draw_text(mx - largura - 10, my + 80 + 50 * qtde, struct_get_names(obj_davi.doencas)[i] + ": " + string(doenca[1]))
							qtde++
						}
					}
				}
			}
		}
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		for (var i = 0; i < 8; i++) {
			var altura =  (array_length(quebrar_texto(vet2[i], 400)) + 1) * string_height("A") * 1.2 + 20
			if point_in_rectangle(mx, my, 460, _a + 80 * i - 25, 860, _a + 80 * i + 25) {
				draw_rectangle_color(mx + 70, my + 65, mx + 70 + 420, my + 65 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
				draw_rectangle_color(mx + 75, my + 70, mx + 65 + 420, my + 70 + string_height("A") * 1.2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
				draw_rectangle_color(mx + 75, my + 75 + string_height("A") * 1.2, mx + 65 + 420, my + 60 + altura, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
				draw_text(mx + 85, my + 80, vet[i])
				draw_text_ext(mx + 85, my + 80 + string_height("A") * 1.2, vet2[i], string_height("A") * 1.2, 400)
			}
		}
		
		var altura = 0 //colocar aqui o numero de linhas
		var largura = string_width("Doenças de Roger")
		var saudavel = true
		for (var i = 0; i < array_length(struct_get_names(obj_personagem.doencas)); i++) {
			var doenca = variable_struct_get(obj_personagem.doencas, struct_get_names(obj_davi.doencas)[i])
			if doenca[0] {
				saudavel = false
				altura++
				if string_width(doenca[1]) + string_width(struct_get_names(obj_personagem.doencas)[i]) > largura {
				largura = string_width(struct_get_names(obj_personagem.doencas)[i]) +  string_width(": ") + string_width(doenca[1])
				}
			}
		}
		altura *= 50 
		if altura == 0 {
			altura = 50
		}
		var qtde = 0
		if point_in_rectangle(mx, my, 430 - 25, 420 - 25, 430 + 25, 420 + 25) {
			draw_rectangle_color(mx + 5, my + 20, mx + 20 + largura, my + 85 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(mx + 10, my + 25, mx + 15 + largura, my + 75, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			draw_rectangle_color(mx + 10, my + 80, mx + 15 + largura, my + 80 + altura, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			draw_text(mx + 15, my + 30, "Doenças de Roger")
			if saudavel {
				draw_text(mx + 15, my + 85, "Saudável")
			} else {
				for (var i = 0; i < array_length(struct_get_names(obj_personagem.doencas)); i++) {
					var doenca = variable_struct_get(obj_personagem.doencas, struct_get_names(obj_personagem.doencas)[i])
					if doenca[0] {
						draw_text(mx + 15, my + 80 + 50 * qtde, struct_get_names(obj_personagem.doencas)[i] + ": " + string(doenca[1]))
						qtde++
					}
				}
			}
		}
	}
}
