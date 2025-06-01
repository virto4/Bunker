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

if clicou {
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
}