/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function quebrar_texto(texto, largura_maxima) {
    var linhas = [];
    var palavras = string_split(texto, " ");
    var linha_atual = "";
    var i;

    for (i = 0; i < array_length(palavras); i++) {
        var palavra = palavras[i];
        var linha_teste = linha_atual + palavra + " ";

        if (string_width(linha_teste) > largura_maxima) {
            array_push(linhas, string_trim(linha_atual));
            linha_atual = palavra + " ";
        } else {
            linha_atual = linha_teste;
        }
    }

    if (linha_atual != "") {
        array_push(linhas, string_trim(linha_atual));
    }

    return linhas;
}

if clicou and image_index == image_number - 1{
	pagina_esquerda = quebrar_texto(ds_list_find_value(paginas_escritas, 2 * pagina), 375) 
	pagina_direita = quebrar_texto(ds_list_find_value(paginas_escritas, 2 * pagina + 1), 375) 
	
	var _largura_x = 85
	draw_sprite(spr_interface_diario, 0, 1920 / 2, 1080 / 2)
	draw_sprite(spr_x, 0, 1800, 120)
	draw_set_color(c_black)
	draw_set_font(fnt_venice_classic)
	for (var _i = 0; _i < array_length(pagina_esquerda); _i++) {
	    draw_text(1920 / 2 - 450, 1080 / 2 - 350 + _i * string_height("A"), pagina_esquerda[_i]);
	}
	for (var _i = 0; _i < array_length(pagina_direita); _i++) {
	    draw_text(1920 / 2 + 25, 1080 / 2 - 350 + _i * string_height("A"), pagina_direita[_i]);
	}
	draw_set_font(fnt_kiwisoda)
	draw_text(1920 / 2 - 450, 1080 / 2 + 350, "voltar")
	draw_text(1920 / 2 + 400, 1080 / 2 + 350, "avançar")
	draw_text(1920 / 2 - 300, 1080 / 2 + 350, "primeira página")
	if display_mouse_get_x() * 1920 / 1366 > 1800 - _largura_x / 2 and display_mouse_get_x() * 1920 / 1366 < 1800 + _largura_x / 2 and display_mouse_get_y() * 1080 / 768 > 120 - _largura_x / 2 and display_mouse_get_y() *  1080 / 768 < 120 + _largura_x / 2 {
		if mouse_check_button_pressed(mb_left) {
			clicou = false	
			global.tem_tela_aberta = false
		}
	}

	draw_set_font(fnt_kiwisoda)
	draw_text(1920 / 2 - 500, 1080 / 2 - 450, pagina * 2)
	draw_text(1920 / 2 + 500, 1080 / 2 - 450, pagina * 2 + 1)
	
	if pagina == 0 {
		var _sprite_humor
		switch obj_personagem.atributos.humor {
			case "COM NOJO":
				_sprite_humor = spr_nojo
				break
			case "HIPERATIVO":
				_sprite_humor = spr_hiperativo
				break
			case "APAVORADO":
				_sprite_humor = spr_apavorado
				break
			case "FURIOSO":
				_sprite_humor = spr_furioso
				break
			case "DEPRIMIDO":
				_sprite_humor = spr_deprimido
				break
			case "NEUTRO":
				_sprite_humor = spr_neutro
				break
		}
		
		
		
		draw_sprite(spr_sede_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 300)
		draw_sprite(spr_fome_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 240)
		draw_sprite(spr_saude_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 180)
		draw_sprite(spr_sanidade_cheio, 0, 1920 / 2 - 300, 1080 / 2 - 120)
		draw_sprite(_sprite_humor, 0, 1920 / 2 - 300, 1080 / 2 - 60)
		draw_sprite(spr_sagacidade_cheio, 0, 1920 / 2 - 300, 1080 / 2)
		draw_sprite(spr_forca_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 60)
		draw_sprite(spr_resistencia_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 120)
		draw_sprite(spr_fortuna_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 180)
		draw_sprite(spr_fadiga_cheio, 0, 1920 / 2 - 300, 1080 / 2 + 240)
		
		draw_sprite_part(spr_sede_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sede / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 300 - 25)
		draw_sprite_part(spr_fome_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.fome / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 240 - 25)
		draw_sprite_part(spr_saude_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.saude / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 180 - 25)
		draw_sprite_part(spr_sanidade_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sanidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 120 - 25)
		draw_sprite_part(spr_sagacidade_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.sagacidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 - 25)
		draw_sprite_part(spr_forca_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.forca / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 60 - 25)
		draw_sprite_part(spr_resistencia_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.resistencia / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 120 - 25)
		draw_sprite_part(spr_fortuna_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.fortuna / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 180 - 25)
		draw_sprite_part(spr_fadiga_var, 0, 0, 0, 48 + 345 * obj_personagem.atributos.fadiga/ 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 - 300 - 200, 1080 / 2 + 240 - 25)
		
		
		switch obj_davi.atributos.humor {
			case "COM NOJO":
				_sprite_humor = spr_nojo
				break
			case "HIPERATIVO":
				_sprite_humor = spr_hiperativo
				break
			case "APAVORADO":
				_sprite_humor = spr_apavorado
				break
			case "FURIOSO":
				_sprite_humor = spr_furioso
				break
			case "DEPRIMIDO":
				_sprite_humor = spr_deprimido
				break
			case "NEUTRO":
				_sprite_humor = spr_neutro
				break
		}
		
		draw_sprite_ext(spr_sede_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 300, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_fome_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 240, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_saude_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 180, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_sanidade_cheio, 0, 1920 / 2 + 300, 1080 / 2 - 120, -1, 1, 0, c_white, 1)
		draw_sprite_ext(_sprite_humor, 0, 1920 / 2 + 300, 1080 / 2 - 60, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_sagacidade_cheio, 0, 1920 / 2 + 300, 1080 / 2, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_forca_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 60, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_resistencia_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 120, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_fortuna_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 180, -1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_fadiga_cheio, 0, 1920 / 2 + 300, 1080 / 2 + 240, -1, 1, 0, c_white, 1)
		
		draw_sprite_part_ext(spr_sede_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sede / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 300 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_fome_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.fome / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 240 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_saude_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.saude / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 180 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_sanidade_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sanidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 120 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_sagacidade_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.sagacidade / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_forca_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.forca / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 60 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_resistencia_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.resistencia / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 120 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_fortuna_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.fortuna / 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 180 - 25, -1, 1, c_white, 1)
		draw_sprite_part_ext(spr_fadiga_var, 0, 0, 0, 48 + 345 * obj_davi.atributos.fadiga/ 100, sprite_get_height(spr_fortuna_cheio), 1920 / 2 + 300 + 200, 1080 / 2 + 240 - 25, -1, 1, c_white, 1)
	}
}