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

if room_get_name(room) = "rm_conquistas" {
	if position_meeting(mouse_x, mouse_y, obj_conquistas) {
		var _filho = instance_position(mouse_x, mouse_y, obj_conquistas)
		draw_sprite(spr_descricao, 0, mouse_x + sprite_get_width(spr_cursor_padrao), mouse_y + sprite_get_height(spr_cursor_padrao))
		draw_set_font(fnt_descricoes)
		draw_set_color(c_black)
		if _filho != noone {
			var _titulo = quebrar_texto(_filho.titulo + "", 280)
			var _descricao = quebrar_texto(_filho.descricao + "", 280)
			for (var _i = 0; _i < array_length(_titulo); _i++) {
			    draw_text(mouse_x + sprite_get_width(spr_cursor_padrao) + 30, mouse_y + sprite_get_height(spr_cursor_padrao) + 30 + _i * string_height("A"), _titulo[_i]);
			}
			for (var _i = 0; _i < array_length(_descricao); _i++) {
			    draw_text(mouse_x + sprite_get_width(spr_cursor_padrao) + 30, mouse_y + sprite_get_height(spr_cursor_padrao) + 85 + _i * string_height("A"), _descricao[_i]);
			}
		}
	}
} else {
	if ganhou_conquista {
		if ds_list_size(global.lista_ganhos) > 0 {
			for (var _i = 0; _i < ds_list_size(global.lista_ganhos); _i++) {
				draw_sprite_ext(ds_list_find_value(global.lista_ganhos, _i).sprite, 0, 1550, 900 - 120 * _i, 1, 1, 0, c_white, ds_list_find_value(global.lista_ganhos, _i).alpha)
				if ds_list_find_value(global.lista_ganhos, _i).alpha < 1 and ds_list_find_value(global.lista_ganhos, _i).tempo == 0 {
					ds_list_find_value(global.lista_ganhos, _i).alpha += 0.05
				} else if ds_list_find_value(global.lista_ganhos, _i).tempo < 200 {
					ds_list_find_value(global.lista_ganhos, _i).tempo  += 1
				} else if ds_list_find_value(global.lista_ganhos, _i).alpha > 0 {
					ds_list_find_value(global.lista_ganhos, _i).alpha -= 0.05
				} else {
					ds_list_delete(global.lista_ganhos, _i)
					break
				}
			} 
		} else {
			ganhou_conquista = false
		}
	}
}