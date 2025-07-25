/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
		}
		if mx < posicoes[0][0] + 16 and mx > posicoes[0][0] - 16 and my < posicoes[0][1] + 16 and my > posicoes[0][1] - 16 and bolo_chocolate {
			obj_freezer.quantidades[6][1] += 1
			obj_freezer.quantidades[6][1] -= 1
		}
		if mx < posicoes[1][0] + 16 and mx > posicoes[1][0] - 16 and my < posicoes[1][1] + 16 and my > posicoes[1][1] - 16 and bolo_quatro_quartos {
			obj_freezer.quantidades[7][1] += 1
		}
		if mx < posicoes[2][0] + 16 and mx > posicoes[2][0] - 16 and my < posicoes[2][1] + 16 and my > posicoes[2][1] - 16 and coookie {
			obj_freezer.quantidades[11][1] += 1
		}
		if mx < posicoes[3][0] + 16 and mx > posicoes[3][0] - 16 and my < posicoes[3][1] + 16 and my > posicoes[3][1] - 16 and chucrute {
			obj_freezer.quantidades[10][1] += 1
		}
		if mx < posicoes[4][0] + 16 and mx > posicoes[4][0] - 16 and my < posicoes[4][1] + 16 and my > posicoes[4][1] - 16 and arroz_frango {
			obj_freezer.quantidades[4][1] += 1
		}
		if mx < posicoes[5][0] + 16 and mx > posicoes[5][0] - 16 and my < posicoes[5][1] + 16 and my > posicoes[5][1] - 16 and escondidinho {
			obj_freezer.quantidades[12][1] += 1
		}
		if mx < posicoes[6][0] + 16 and mx > posicoes[6][0] - 16 and my < posicoes[6][1] + 16 and my > posicoes[6][1] - 16 and ovo_mexido {
			obj_freezer.quantidades[16][1] += 1
		}
		if mx < posicoes[7][0] + 16 and mx > posicoes[7][0] - 16 and my < posicoes[7][1] + 16 and my > posicoes[7][1] - 16 and salada {
			obj_freezer.quantidades[18][1] += 1
		}
	}
}

if ds_list_find_index(global.alimentos_pegos, obj_acucar) != -1 and ds_list_find_index(global.alimentos_pegos, obj_farinha) != -1 and ds_list_find_index(global.alimentos_pegos, obj_chocolate) != -1 and ds_list_find_index(global.alimentos_pegos, obj_ovo) != -1 {
	bolo_chocolate = true
	cookie = true
} else {
	bolo_chocolate = false
	cookie = false
}

if ds_list_find_index(global.alimentos_pegos, obj_acucar) != -1 and ds_list_find_index(global.alimentos_pegos, obj_farinha) != -1 and ds_list_find_index(global.alimentos_pegos, obj_ovo) != -1 {
	bolo_quatro_quartos = true
} else {
	bolo_quatro_quartos = false
}

if ds_list_find_index(global.alimentos_pegos, obj_frango) != -1 and ds_list_find_index(global.alimentos_pegos, obj_alface) != -1 {
	salada = true
} else {
	salada = false
}

if ds_list_find_index(global.alimentos_pegos, obj_frango) != -1 and ds_list_find_index(global.alimentos_pegos, obj_arroz) != -1 {
	arroz_frango= true
} else {
	arroz_frango = false
}

if ds_list_find_index(global.alimentos_pegos, obj_frango) != -1 and ds_list_find_index(global.alimentos_pegos, obj_batata) != -1 {
	escondidinho = true
} else {
	escondidinho = false
}

if ds_list_find_index(global.alimentos_pegos, obj_repolho) != -1 {
	chucrute = true
} else {
	chucrute = false
}

var ovos = 0
for (var i = 0; i < ds_list_size(global.alimentos_pegos); i++) {
	if ds_list_find_value(global.alimentos_pegos, i) == obj_ovo{
		ovos++
	}
}

if ovos >= 3 {
	ovo_mexido = true
} else {
	ovo_mexido = false
}