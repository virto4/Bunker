/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function desenhar(obj, spr, booleano, posicao) {
	if ds_list_find_index(receitas, obj) == -1 {
		draw_sprite_ext(spr, 0, posicao[0], posicao[1], 4, 4, 0, c_black, 1)
	} else if !booleano {
		draw_sprite_ext(spr, 0, posicao[0], posicao[1], 4, 4, 0, c_white, 0.5)
	} else {
		draw_sprite_ext(spr, 0, posicao[0], posicao[1], 4, 4, 0, c_white, 1)
	}
}

function ingredientes(lista_ingredientes) {
	var n = 0
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	var alfa = 1
	for (var i = 0; i < array_length(lista_ingredientes); i++) {
		if variable_struct_get(obj_personagem.qtde_itens1, object_get_name(lista_ingredientes[i][1])) >= 1 {
			alfa = 1
		} else {
			alfa = 0.5
		}
		draw_sprite_ext(lista_ingredientes[i][0], 0, mx + sprite_get_width(spr_cursor_padrao) + 60 + n * 70, 
						 my + sprite_get_height(spr_cursor_padrao) + 110, 2, 2, 0, c_white, alfa)
		n++
	}
}

if clicou {
	draw_sprite_ext(spr_interface_cozinha, 0, 1920 / 2, 1080 / 2, 6, 6, 0, c_white, 1)
	draw_sprite(spr_voltar, 0, 1920 - 300, 50)
	desenhar(obj_bolo_chocolate, spr_bolo_chocolate, bolo_chocolate, posicoes[0])
	desenhar(obj_bolo_quatro_quartos, spr_bolo_quatro_quartos, bolo_quatro_quartos, posicoes[1])
	desenhar(obj_cookie, spr_cookie, cookie, posicoes[2])
	desenhar(obj_chucrute, spr_chucrute, chucrute, posicoes[3])
	desenhar(obj_arroz_frango, spr_arroz_frango, arroz_frango, posicoes[4])
	desenhar(obj_escondidinho, spr_escondidinho, escondidinho, posicoes[5])
	desenhar(obj_ovo_mexido, spr_ovo_mexido, ovo_mexido, posicoes[6])
	desenhar(obj_salada, spr_salada, salada, posicoes[7])
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	draw_set_font(fnt_descricoes)
	draw_set_color(c_black)
	
	if mx < posicoes[0][0] + 64 and mx > posicoes[0][0] - 64 and my < posicoes[0][1] + 64 and my > posicoes[0][1] - 64 and ds_list_find_index(receitas, obj_bolo_chocolate) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Bolo de chocolate")
		ingredientes([[spr_acucar, obj_acucar], [spr_ovo, obj_ovo], [spr_chocolate, obj_chocolate], [spr_farinha, obj_farinha]])
	}
	if mx < posicoes[1][0] + 64 and mx > posicoes[1][0] - 64 and my < posicoes[1][1] + 64 and my > posicoes[1][1] - 64 and ds_list_find_index(receitas, obj_bolo_quatro_quartos) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Bolo quatro quartos")
		ingredientes([[spr_acucar, obj_acucar], [spr_ovo, obj_ovo], [spr_farinha, obj_farinha]])
	}
	if mx < posicoes[2][0] + 64 and mx > posicoes[2][0] - 64 and my < posicoes[2][1] + 64 and my > posicoes[2][1] - 64 and ds_list_find_index(receitas, obj_cookie) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Cookie")
		ingredientes([[spr_acucar, obj_acucar], [spr_ovo, obj_ovo], [spr_chocolate, obj_chocolate], [spr_farinha, obj_farinha]])
	}
	if mx < posicoes[3][0] + 64 and mx > posicoes[3][0] - 64 and my < posicoes[3][1] + 64 and my > posicoes[3][1] - 64 and ds_list_find_index(receitas, obj_chucrute) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Chucrute")
		ingredientes([[spr_repolho, obj_repolho]])
	}
	if mx < posicoes[4][0] + 64 and mx > posicoes[4][0] - 64 and my < posicoes[4][1] + 64 and my > posicoes[4][1] - 64 and ds_list_find_index(receitas, obj_arroz_frango) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Arroz com frango")
		ingredientes([[spr_arroz, obj_arroz], [spr_frango, obj_frango]])
	}
	if mx < posicoes[5][0] + 64 and mx > posicoes[5][0] - 64 and my < posicoes[5][1] + 64 and my > posicoes[5][1] - 64 and ds_list_find_index(receitas, obj_escondidinho) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Escondidinho")
		ingredientes([[spr_batata, obj_batata], [spr_frango, obj_frango]])
	}
	if mx < posicoes[6][0] + 64 and mx > posicoes[6][0] - 64 and my < posicoes[6][1] + 64 and my > posicoes[6][1] - 64 and ds_list_find_index(receitas, obj_ovo_mexido) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Ovos mexidos")
		ingredientes([[spr_ovo, obj_ovo]])
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 66, my + sprite_get_height(spr_cursor_padrao) + 110, 3)
	}
	if mx < posicoes[7][0] + 64 and mx > posicoes[7][0] - 64 and my < posicoes[7][1] + 64 and my > posicoes[7][1] - 64 and ds_list_find_index(receitas, obj_salada) != -1 {
		draw_sprite(spr_descricao, 0, mx + sprite_get_width(spr_cursor_padrao), my + sprite_get_height(spr_cursor_padrao))
		draw_text(mx + sprite_get_width(spr_cursor_padrao) + 30, my + sprite_get_height(spr_cursor_padrao) + 30, "Salada Ceasar")
		ingredientes([[spr_alface, obj_alface], [spr_frango, obj_frango]])
	}
}