/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if ganhou_conquista {
	if ds_list_size(lista_ganhos) > 0 {
		for (var _i = 0; _i < ds_list_size(lista_ganhos); _i++) {
			draw_sprite_ext(ds_list_find_value(lista_ganhos, _i).sprite, 0, 1550, 900 - 120 * _i, 1, 1, 0, c_white, ds_list_find_value(lista_ganhos, _i).alpha)
			if ds_list_find_value(lista_ganhos, _i).alpha < 1 and ds_list_find_value(lista_ganhos, _i).tempo == 0 {
				ds_list_find_value(lista_ganhos, _i).alpha += 0.05
			} else if ds_list_find_value(lista_ganhos, _i).tempo < 200 {
				ds_list_find_value(lista_ganhos, _i).tempo  += 1
			} else if ds_list_find_value(lista_ganhos, _i).alpha > 0 {
				ds_list_find_value(lista_ganhos, _i).alpha -= 0.05
			} else {
				ds_list_delete(lista_ganhos, _i)
				break
			}
		} 
	} else {
		ganhou_conquista = false
	}
}