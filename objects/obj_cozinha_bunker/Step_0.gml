/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function destruir_slot(itens) {
	for (var i = 0; i < array_length(itens); i++) {
		var qtde = itens[i][1]
		var nome = itens[i][0]
		var tirou_slot = false
		for (var j = 0; j < 5; j++) {
			if j == 0 and object_get_name(obj_personagem.slot1) == nome {
				obj_personagem.slot1 = noone
				tirou_slot = true
			} else if j == 1 and object_get_name(obj_personagem.slot2) == nome {
				obj_personagem.slot2 = noone
				tirou_slot = true
			} else if j == 2 and object_get_name(obj_personagem.slot3) == nome {
				obj_personagem.slot3 = noone
				tirou_slot = true
			} else if j == 3 and object_get_name(obj_personagem.slot4) == nome {
				obj_personagem.slot4 = noone
				tirou_slot = true
			} else if j == 4 and object_get_name(obj_personagem.slot5) == nome {
				obj_personagem.slot5 = noone
				tirou_slot = true
			}
			if tirou_slot {
				break
			}
		}
		if !tirou_slot {
			obj_freezer.quantidades[qtde][1] -= 1
		}
	}
}

if clicou {
	if mouse_check_button_pressed(mb_left) {
		var width = sprite_get_width(spr_voltar) / 2
		var height = sprite_get_height(spr_voltar) / 2
		var x_sair = 1620
		var y_sair = 50
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		if mx < x_sair + width and mx > x_sair - width and my < y_sair + height and my > y_sair - height {
			clicou = false
			global.tem_tela_aberta = false
			global.tela_hotbar = false
		}
		if mx < posicoes[0][0] + 64 and mx > posicoes[0][0] - 64 and my < posicoes[0][1] + 64 and my > posicoes[0][1] - 64 and bolo_chocolate {
			obj_freezer.quantidades[6][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_bolo_chocolate", variable_struct_get(obj_personagem.qtde_itens1, "obj_bolo_chocolate") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_ovo", variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_acucar", variable_struct_get(obj_personagem.qtde_itens1, "obj_acucar") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_farinha", variable_struct_get(obj_personagem.qtde_itens1, "obj_farinha") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_chocolate", variable_struct_get(obj_personagem.qtde_itens1, "obj_chocolate") - 1)
			destruir_slot([["obj_ovo", 15], ["obj_acucar", 0], ["obj_farinha", 13], ["obj_chocolate", 9]])
		}
		if mx < posicoes[1][0] + 64 and mx > posicoes[1][0] - 64 and my < posicoes[1][1] + 64 and my > posicoes[1][1] - 64 and bolo_quatro_quartos {
			obj_freezer.quantidades[7][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_bolo_quatro_quartos", variable_struct_get(obj_personagem.qtde_itens1, "obj_bolo_quatro_quartos") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_ovo", variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_acucar", variable_struct_get(obj_personagem.qtde_itens1, "obj_acucar") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_farinha", variable_struct_get(obj_personagem.qtde_itens1, "obj_farinha") - 1)
			destruir_slot([["obj_ovo", 15], ["obj_acucar", 0], ["obj_farinha", 13]])
		}
		if mx < posicoes[2][0] + 64 and mx > posicoes[2][0] - 64 and my < posicoes[2][1] + 64 and my > posicoes[2][1] - 64 and cookie {
			obj_freezer.quantidades[11][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_cookie", variable_struct_get(obj_personagem.qtde_itens1, "obj_cookie") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_ovo", variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_acucar", variable_struct_get(obj_personagem.qtde_itens1, "obj_acucar") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_farinha", variable_struct_get(obj_personagem.qtde_itens1, "obj_farinha") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_chocolate", variable_struct_get(obj_personagem.qtde_itens1, "obj_chocolate") - 1)
			destruir_slot([["obj_ovo", 15], ["obj_acucar", 0], ["obj_farinha", 13], ["obj_chocolate", 9]])
		}
		if mx < posicoes[3][0] + 64 and mx > posicoes[3][0] - 64 and my < posicoes[3][1] +64 and my > posicoes[3][1] - 64 and chucrute {
			obj_freezer.quantidades[10][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_chucrute", variable_struct_get(obj_personagem.qtde_itens1, "obj_chucrute") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_repolho", variable_struct_get(obj_personagem.qtde_itens1, "obj_repolho") - 1)
			destruir_slot([["obj_repolho", 17]])
		}
		if mx < posicoes[4][0] + 64 and mx > posicoes[4][0] - 64 and my < posicoes[4][1] + 64 and my > posicoes[4][1] - 64 and arroz_frango {
			obj_freezer.quantidades[4][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_arroz_frango", variable_struct_get(obj_personagem.qtde_itens1, "obj_arroz_frango") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_arroz", variable_struct_get(obj_personagem.qtde_itens1, "obj_arroz") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_frango", variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") - 1)
			destruir_slot([["obj_frango", 14], ["obj_arroz", 3]])
		}
		if mx < posicoes[5][0] + 64 and mx > posicoes[5][0] - 64 and my < posicoes[5][1] + 64 and my > posicoes[5][1] - 64 and escondidinho {
			obj_freezer.quantidades[12][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_escondidinho", variable_struct_get(obj_personagem.qtde_itens1, "obj_escondidinho") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_batata", variable_struct_get(obj_personagem.qtde_itens1, "obj_batata") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_frango", variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") - 1)
			destruir_slot([["obj_frango", 14], ["obj_batata", 5]])
		}
		if mx < posicoes[6][0] + 64 and mx > posicoes[6][0] - 64 and my < posicoes[6][1] + 64 and my > posicoes[6][1] - 64 and ovo_mexido {
			obj_freezer.quantidades[16][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_ovo_mexido", variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo_mexido") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_ovo", variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") - 3)
			destruir_slot([["obj_ovo", 15], ["obj_ovo", 15], ["obj_ovo", 15]])
		}
		if mx < posicoes[7][0] + 64 and mx > posicoes[7][0] - 64 and my < posicoes[7][1] + 64 and my > posicoes[7][1] - 64 and salada {
			obj_freezer.quantidades[18][1] += 1
			variable_struct_set(obj_personagem.qtde_itens1, "obj_salada", variable_struct_get(obj_personagem.qtde_itens1, "obj_salada") + 1)
			variable_struct_set(obj_personagem.qtde_itens1, "obj_alface", variable_struct_get(obj_personagem.qtde_itens1, "obj_alface") - 1)
			variable_struct_set(obj_personagem.qtde_itens1, "onj_frango", variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") - 1)
			destruir_slot([["obj_frango", 14], ["obj_alface", 2]])
		}
	}
}

if variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_chocolate") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_farinha") >= 1 and  variable_struct_get(obj_personagem.qtde_itens1, "obj_acucar") >= 1 {
	bolo_chocolate = true
	cookie = true
} else {
	bolo_chocolate = false
	cookie = false
}

if variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_farinha") >= 1 and  variable_struct_get(obj_personagem.qtde_itens1, "obj_acucar") >= 1 {
	bolo_quatro_quartos = true
} else {
	bolo_quatro_quartos = false
}

if variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_alface") >= 1 {
	salada = true
} else {
	salada = false
}

if variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_arroz") >= 1 {
	arroz_frango= true
} else {
	arroz_frango = false
}

if variable_struct_get(obj_personagem.qtde_itens1, "obj_frango") >= 1 and variable_struct_get(obj_personagem.qtde_itens1, "obj_batata") >= 1 {
	escondidinho = true
} else {
	escondidinho = false
}

if  variable_struct_get(obj_personagem.qtde_itens1, "repolho") >= 1 {
	chucrute = true
} else {
	chucrute = false
}

if  variable_struct_get(obj_personagem.qtde_itens1, "obj_ovo") >= 3 {
	ovo_mexido = true
} else {
	ovo_mexido = false
}